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

ActiveRecord::Schema.define(version: 2021_11_06_020605) do

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
    t.boolean "is_disable"
    t.decimal "prize"
    t.decimal "total_prize"
    t.index ["br_stock_id"], name: "index_calls_on_br_stock_id"
    t.index ["expiration_id"], name: "index_calls_on_expiration_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "custom_order"
  end

  create_table "cripto_dividends", force: :cascade do |t|
    t.integer "category_id"
    t.integer "month_id"
    t.integer "year_id"
    t.date "record_date"
    t.date "pay_date"
    t.decimal "value_per_share"
    t.decimal "total"
    t.decimal "yield_on_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "portfolio_id"
    t.integer "portfolio_cripto_id"
    t.integer "cripto_id"
    t.decimal "brl_total"
    t.decimal "usd_total"
    t.index ["category_id"], name: "index_cripto_dividends_on_category_id"
    t.index ["cripto_id"], name: "index_cripto_dividends_on_cripto_id"
    t.index ["month_id"], name: "index_cripto_dividends_on_month_id"
    t.index ["portfolio_cripto_id"], name: "index_cripto_dividends_on_portfolio_cripto_id"
    t.index ["portfolio_id"], name: "index_cripto_dividends_on_portfolio_id"
    t.index ["year_id"], name: "index_cripto_dividends_on_year_id"
  end

  create_table "criptos", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dividends", force: :cascade do |t|
    t.integer "month_id"
    t.integer "year_id"
    t.decimal "fiis"
    t.decimal "criptos"
    t.decimal "br_stocks"
    t.decimal "properties"
    t.decimal "equities"
    t.decimal "international"
    t.decimal "derivatives"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "portfolio_id"
    t.index ["month_id"], name: "index_dividends_on_month_id"
    t.index ["portfolio_id"], name: "index_dividends_on_portfolio_id"
    t.index ["year_id"], name: "index_dividends_on_year_id"
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
    t.decimal "one_year_price"
    t.decimal "thirty_days_price"
    t.decimal "from_the_top"
    t.decimal "from_the_bottom"
    t.decimal "last_dividend"
    t.decimal "last_yield"
    t.decimal "six_m_yield"
    t.decimal "twelve_m_yield"
    t.decimal "p_vpa"
    t.string "setor"
    t.decimal "assets"
  end

  create_table "fixed_incomes", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goods", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "international_categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "internationals", force: :cascade do |t|
    t.integer "international_category_id"
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["international_category_id"], name: "index_internationals_on_international_category_id"
  end

  create_table "months", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "portfolio_id"
    t.integer "year_id"
    t.integer "month_id"
    t.decimal "total_today"
    t.decimal "order_value"
    t.string "order_type"
    t.decimal "tokens_amount"
    t.decimal "token_price"
    t.decimal "month_profit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["month_id"], name: "index_orders_on_month_id"
    t.index ["portfolio_id"], name: "index_orders_on_portfolio_id"
    t.index ["year_id"], name: "index_orders_on_year_id"
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
    t.decimal "dividend_profit"
    t.decimal "trade_profit"
    t.decimal "derivatives_profit"
    t.index ["br_stock_id"], name: "index_portfolio_br_stocks_on_br_stock_id"
    t.index ["category_id"], name: "index_portfolio_br_stocks_on_category_id"
    t.index ["portfolio_id"], name: "index_portfolio_br_stocks_on_portfolio_id"
  end

  create_table "portfolio_calls", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "call_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "situation_id"
    t.decimal "price"
    t.decimal "total_price"
    t.decimal "profit"
    t.integer "br_stock_id"
    t.integer "expiration_id"
    t.index ["br_stock_id"], name: "index_portfolio_calls_on_br_stock_id"
    t.index ["call_id"], name: "index_portfolio_calls_on_call_id"
    t.index ["category_id"], name: "index_portfolio_calls_on_category_id"
    t.index ["expiration_id"], name: "index_portfolio_calls_on_expiration_id"
    t.index ["portfolio_id"], name: "index_portfolio_calls_on_portfolio_id"
    t.index ["situation_id"], name: "index_portfolio_calls_on_situation_id"
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
    t.decimal "dividends_profit"
    t.decimal "trade_profit"
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
    t.decimal "dividends_profit"
    t.decimal "trade_profit"
    t.index ["category_id"], name: "index_portfolio_fiis_on_category_id"
    t.index ["fii_id"], name: "index_portfolio_fiis_on_fii_id"
    t.index ["portfolio_id"], name: "index_portfolio_fiis_on_portfolio_id"
  end

  create_table "portfolio_fixed_incomes", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "fixed_income_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_derivative_warranty"
    t.index ["category_id"], name: "index_portfolio_fixed_incomes_on_category_id"
    t.index ["fixed_income_id"], name: "index_portfolio_fixed_incomes_on_fixed_income_id"
    t.index ["portfolio_id"], name: "index_portfolio_fixed_incomes_on_portfolio_id"
  end

  create_table "portfolio_goods", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "good_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_portfolio_goods_on_category_id"
    t.index ["good_id"], name: "index_portfolio_goods_on_good_id"
    t.index ["portfolio_id"], name: "index_portfolio_goods_on_portfolio_id"
  end

  create_table "portfolio_internationals", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "international_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_portfolio_internationals_on_category_id"
    t.index ["international_id"], name: "index_portfolio_internationals_on_international_id"
    t.index ["portfolio_id"], name: "index_portfolio_internationals_on_portfolio_id"
  end

  create_table "portfolio_internationas", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "stock_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_portfolio_internationas_on_category_id"
    t.index ["portfolio_id"], name: "index_portfolio_internationas_on_portfolio_id"
    t.index ["stock_id"], name: "index_portfolio_internationas_on_stock_id"
  end

  create_table "portfolio_properties", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "property_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_portfolio_properties_on_category_id"
    t.index ["portfolio_id"], name: "index_portfolio_properties_on_portfolio_id"
    t.index ["property_id"], name: "index_portfolio_properties_on_property_id"
  end

  create_table "portfolio_puts", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "put_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "situation_id"
    t.decimal "price"
    t.decimal "total_price"
    t.decimal "total_strike"
    t.decimal "profit"
    t.integer "br_stock_id"
    t.integer "expiration_id"
    t.index ["br_stock_id"], name: "index_portfolio_puts_on_br_stock_id"
    t.index ["category_id"], name: "index_portfolio_puts_on_category_id"
    t.index ["expiration_id"], name: "index_portfolio_puts_on_expiration_id"
    t.index ["portfolio_id"], name: "index_portfolio_puts_on_portfolio_id"
    t.index ["put_id"], name: "index_portfolio_puts_on_put_id"
    t.index ["situation_id"], name: "index_portfolio_puts_on_situation_id"
  end

  create_table "portfolio_stocks", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "stock_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_portfolio_stocks_on_category_id"
    t.index ["portfolio_id"], name: "index_portfolio_stocks_on_portfolio_id"
    t.index ["stock_id"], name: "index_portfolio_stocks_on_stock_id"
  end

  create_table "portfolio_subscriptions", force: :cascade do |t|
    t.integer "category_id"
    t.integer "portfolio_id"
    t.integer "subscription_id"
    t.decimal "shares_amount"
    t.decimal "share_cost"
    t.decimal "total_cost"
    t.decimal "total_today"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_portfolio_subscriptions_on_category_id"
    t.index ["portfolio_id"], name: "index_portfolio_subscriptions_on_portfolio_id"
    t.index ["subscription_id"], name: "index_portfolio_subscriptions_on_subscription_id"
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
    t.boolean "is_disable"
    t.decimal "prize"
    t.decimal "total_prize"
    t.index ["br_stock_id"], name: "index_puts_on_br_stock_id"
    t.index ["expiration_id"], name: "index_puts_on_expiration_id"
  end

  create_table "situations", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.integer "fii_id"
    t.index ["fii_id"], name: "index_subscriptions_on_fii_id"
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
