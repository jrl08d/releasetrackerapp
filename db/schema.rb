# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141126175005) do

  create_table "customers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "customers", ["name"], name: "index_customers_on_name"
  add_index "customers", ["user_id"], name: "index_customers_on_user_id"

  create_table "deployments", force: true do |t|
    t.date     "deploy_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.integer  "release_id"
  end

  add_index "deployments", ["customer_id"], name: "index_deployments_on_customer_id"
  add_index "deployments", ["release_id"], name: "index_deployments_on_release_id"

  create_table "issues", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
    t.date     "reported_date"
    t.string   "software_version"
    t.string   "reporter_name"
    t.string   "severity"
    t.integer  "github_issue_number_reference"
  end

  create_table "operators", force: true do |t|
    t.integer  "user_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "operators", ["customer_id"], name: "index_operators_on_customer_id"
  add_index "operators", ["user_id"], name: "index_operators_on_user_id"

  create_table "releases", force: true do |t|
    t.string   "version"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "release_date"
  end

  add_index "releases", ["version"], name: "index_releases_on_version"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
  end

end
