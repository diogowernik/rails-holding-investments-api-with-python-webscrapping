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

ActiveRecord::Schema.define(version: 2021_08_30_232912) do

  create_table "br_stocks", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "calls", force: :cascade do |t|
    t.integer "br_stock_id"
    t.integer "expiration_id"
    t.string "ticker"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "strike"
    t.index ["br_stock_id"], name: "index_calls_on_br_stock_id"
    t.index ["expiration_id"], name: "index_calls_on_expiration_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "criptos", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "etfs", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "expirations", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fiis", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fixed_incomes", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "holding_tokens", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "months", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "portfolio_br_stocks", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "br_stock_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["br_stock_id"], name: "index_portfolio_br_stocks_on_br_stock_id"
    t.index ["category_id"], name: "index_portfolio_br_stocks_on_category_id"
    t.index ["portfolio_id"], name: "index_portfolio_br_stocks_on_portfolio_id"
  end

  create_table "portfolio_criptos", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "cripto_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_portfolio_criptos_on_category_id"
    t.index ["cripto_id"], name: "index_portfolio_criptos_on_cripto_id"
    t.index ["portfolio_id"], name: "index_portfolio_criptos_on_portfolio_id"
  end

  create_table "portfolio_fiis", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "fii_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_portfolio_fiis_on_category_id"
    t.index ["fii_id"], name: "index_portfolio_fiis_on_fii_id"
    t.index ["portfolio_id"], name: "index_portfolio_fiis_on_portfolio_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "puts", force: :cascade do |t|
    t.integer "br_stock_id"
    t.integer "expiration_id"
    t.string "ticker"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "strike"
    t.index ["br_stock_id"], name: "index_puts_on_br_stock_id"
    t.index ["expiration_id"], name: "index_puts_on_expiration_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "years", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
