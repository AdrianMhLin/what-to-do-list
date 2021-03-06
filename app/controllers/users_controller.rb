class UsersController < ApplicationController

  def create

    user = User.create(
      email: params["email"],
      password: params["password"] # HAS TO BE password, not password_digest
    )
    respond_to do |format|
      if user.save
        format.html { redirect_to user, notice: 'Bob was successfully created.' }
        format.json { render :show, status: :created, location: user }
      else
        format.html { render :new }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end

    redirect_to '/'
  end

  def index
    users = User.all
    respond_to do |format|
      format.json { render :json => users}
    end
    # render :index, {locals: {users: users}}
  end

  def new
    render :signup
  end

  def show
    user = User.find(params[:id])
    todos = Todo.where({user_id: params[:id]})

    # respond_to do |format|
    #   format.json { render :json => user}
    # end
    # respond_to do |format|
    #   format.json { render :json => todos}
    # end

    render :show, {locals: {user: user, todos: todos}}
  end


end



# class UsersController < ApplicationController
#   before_action :set_user, only: [:show, :edit, :update, :destroy]

#   # GET /users
#   # GET /users.json
#   def index
#     @users = User.all
#   end

#   # GET /users/1
#   # GET /users/1.json
#   def show
#   end

#   # GET /users/new
#   def new
#     render :signup
#   end

#   # GET /users/1/edit
#   def edit
#   end

#   # POST /users
#   # POST /users.json
#   def create
#     @user = User.new(user_params)

#     respond_to do |format|
#       if @user.save
#         format.html { redirect_to @user, notice: 'User was successfully created.' }
#         format.json { render :show, status: :created, location: @user }
#       else
#         format.html { render :new }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /users/1
#   # PATCH/PUT /users/1.json
#   def update
#     respond_to do |format|
#       if @user.update(user_params)
#         format.html { redirect_to @user, notice: 'User was successfully updated.' }
#         format.json { render :show, status: :ok, location: @user }
#       else
#         format.html { render :edit }
#         format.json { render json: @user.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /users/1
#   # DELETE /users/1.json
#   def destroy
#     @user.destroy
#     respond_to do |format|
#       format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_user
#       @user = User.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def user_params
#       params[:user]
#     end
# end
