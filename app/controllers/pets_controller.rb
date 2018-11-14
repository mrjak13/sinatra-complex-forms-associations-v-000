class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    if !params[:owner_name].empty?
      @owner = Owner.create(name:params[:owner_name])
      @pet = Pet.create(name:params[:pet_name], owner_id:@owner.id)
    elsif params[:owner_name].empty?
      @pet = Pet.create(name:params[:pet_name], owner_id:params[:owner_id])
    end
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
<<<<<<< HEAD
    binding.pry
=======
    # binding.pry
>>>>>>> c3eeac9b3599e9a2529de5f726ca7c9c10d809fa
    @owners = Owner.all
    erb :'/pets/edit'
  end

  patch '/pets/:id' do
    @pet = Pet.find(params[:id])
    # binding.pry
    if !params[:owner_name].empty?
      @owner = Owner.create(name:params[:owner_name])
      @pet.update(name:params[:pet_name], owner_id:@owner.id)
    elsif params[:owner_name].empty?
      @pet.update(name:params[:pet_name], owner_id:params[:owner_id])
    end

    redirect to "pets/#{@pet.id}"
  end
end
