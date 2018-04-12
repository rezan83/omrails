class TweetsController < InheritedResources::Base
  before_action :authenticate_user! ,except: [:index, :show]
  
  def new
    @tweet = current_user.tweets.new
  end
  def edite
    @tweet = current_user.tweets.find(params[:id])
  end
  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to @tweet, notice: "new tweet created"
    else
      render :new
    end
  end
  def update
    @tweet = current_user.tweets.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: "tweet updated"
    else
      render :edite
    end
  end
  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy
    redirect_to tweets_url , notice: "tweet destroyed"
  end

  private

    def tweet_params
      params.require(:tweet).permit(:user_id, :content)
    end
end

