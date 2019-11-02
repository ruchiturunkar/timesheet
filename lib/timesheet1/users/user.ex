defmodule Timesheet1.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :isManager, :boolean, default: false
    field :manager, :string
    field :name, :string 
    field :password_hash, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :isManager, :manager, :password, :password_confirmation])
    |> validate_confirmation(:password)
    |> validate_length(:password, min: 12)
    |> hash_password()
    |> validate_required([:name, :email, :isManager, :manager, :password_hash])
  end

  def hash_password(cset) do
    pw = get_change(cset, :password)
    if pw do
      change(cset, Argon2.add_hash(pw))
    else
      cset
    end
  end


end
