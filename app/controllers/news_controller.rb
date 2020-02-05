class NewsController < ApplicationController

    def index
        if user_signed_in?
            removed_ids = current_user.users_news.removed_news.pluck(:news_id)
            @news = News.where.not(id: removed_ids)
        else
            @news = News.all
        end
    end

    def show
        if user_signed_in?
            unless UsersNews.find_by_user_id_and_news_id(current_user.id,params[:id])
                UsersNews.create(user_id: current_user.id, news_id: params[:id],status: :read)
            end
        end
        @news = News.find(params[:id])
    end

    def remove_news
        if UsersNews.find_by_user_id_and_news_id(current_user.id,params[:id])
            user_news = UsersNews.find_by_user_id_and_news_id(current_user.id,params[:id])
            user_news.update_attributes(status: :removed)
        else
            UsersNews.create(user_id: current_user.id, news_id: params[:id],status: :removed)
        end
        redirect_to news_index_path
    end

    def read_list
        read_ids = current_user.users_news.read_news.pluck(:news_id)
        @news = News.where(id: read_ids)
    end
end
