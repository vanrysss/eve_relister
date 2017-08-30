defmodule Relister.Repo.Migrations.CreateRegion do
  use Ecto.Migration

  def change do
    create table(:region) do
      add :id, :id 
      add :name, :varchar(100), :null false
      add :eve_id ,:integer, :null false
      add :description, :text, :null false
    end
    
    create table(:star_system) do
      add :id, :id
      add :name, :varchar(100), :null false
      add :eve_id, :integer, :null false
      add :sec_status :numeric, :scale 1, :precision 2, :null false
    end

    create table(:station) do
      add :id, :id
      add :name, :varchar(256), :null false

    end
    
  end
end
