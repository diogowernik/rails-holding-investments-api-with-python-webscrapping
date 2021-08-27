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

ActiveRecord::Schema.define(version: 2021_08_27_000425) do

  create_table "anos", force: :cascade do |t|
    t.integer "ano"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ativo_moves", force: :cascade do |t|
    t.integer "tipo_id"
    t.integer "ativo_id"
    t.integer "investimento_id"
    t.integer "corretora_id"
    t.integer "carteira_id"
    t.decimal "valor"
    t.date "data"
    t.integer "quantidade"
    t.string "movimento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ativo_id"], name: "index_ativo_moves_on_ativo_id"
    t.index ["carteira_id"], name: "index_ativo_moves_on_carteira_id"
    t.index ["corretora_id"], name: "index_ativo_moves_on_corretora_id"
    t.index ["investimento_id"], name: "index_ativo_moves_on_investimento_id"
    t.index ["tipo_id"], name: "index_ativo_moves_on_tipo_id"
  end

  create_table "ativos", force: :cascade do |t|
    t.integer "tipo_id"
    t.decimal "valor_atual"
    t.string "ticker"
    t.string "ticker_base"
    t.string "ticker_yf"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tipo_id"], name: "index_ativos_on_tipo_id"
  end

  create_table "br_stocks", force: :cascade do |t|
    t.string "ticker"
    t.string "title"
    t.string "slug"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carteiras", force: :cascade do |t|
    t.integer "user_id"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carteiras_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "corretoras", force: :cascade do |t|
    t.string "nome"
    t.string "moeda"
    t.decimal "corretagem_fiis"
    t.decimal "corretagem_acoes"
    t.decimal "corretagem_opcoes"
    t.decimal "corretagem_exerc"
    t.decimal "corretagem_exerc_porcent"
    t.decimal "corretagem_exerc_iss"
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

  create_table "deriva_moves", force: :cascade do |t|
    t.integer "carteira_id"
    t.integer "estado_id"
    t.integer "corretora_id"
    t.integer "investimento_id"
    t.integer "vencimento_id"
    t.integer "ativo_id"
    t.integer "deriva_tipo_id"
    t.decimal "valor"
    t.decimal "strike"
    t.decimal "strike_total"
    t.decimal "valor_recompra"
    t.decimal "resultado"
    t.date "data"
    t.date "data_recompra"
    t.integer "quantidade"
    t.string "movimento"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "valor_hoje"
    t.decimal "valor_ativo_lancamento"
    t.index ["ativo_id"], name: "index_deriva_moves_on_ativo_id"
    t.index ["carteira_id"], name: "index_deriva_moves_on_carteira_id"
    t.index ["corretora_id"], name: "index_deriva_moves_on_corretora_id"
    t.index ["deriva_tipo_id"], name: "index_deriva_moves_on_deriva_tipo_id"
    t.index ["estado_id"], name: "index_deriva_moves_on_estado_id"
    t.index ["investimento_id"], name: "index_deriva_moves_on_investimento_id"
    t.index ["vencimento_id"], name: "index_deriva_moves_on_vencimento_id"
  end

  create_table "deriva_tipos", force: :cascade do |t|
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "derivativos", force: :cascade do |t|
    t.integer "ativo_id"
    t.integer "vencimento_id"
    t.integer "deriva_tipo_id"
    t.decimal "strike"
    t.string "codigo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ativo_id"], name: "index_derivativos_on_ativo_id"
    t.index ["deriva_tipo_id"], name: "index_derivativos_on_deriva_tipo_id"
    t.index ["vencimento_id"], name: "index_derivativos_on_vencimento_id"
  end

  create_table "estados", force: :cascade do |t|
    t.string "status"
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

  create_table "investimentos", force: :cascade do |t|
    t.integer "ativo_id"
    t.integer "carteira_id"
    t.integer "tipo_id"
    t.integer "corretora_id"
    t.decimal "valor_medio"
    t.integer "quantidade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ativo_id"], name: "index_investimentos_on_ativo_id"
    t.index ["carteira_id"], name: "index_investimentos_on_carteira_id"
    t.index ["corretora_id"], name: "index_investimentos_on_corretora_id"
    t.index ["tipo_id"], name: "index_investimentos_on_tipo_id"
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

  create_table "proventos", force: :cascade do |t|
    t.integer "carteira_id"
    t.integer "ano_id"
    t.decimal "jan", default: "0.0"
    t.decimal "fev", default: "0.0"
    t.decimal "mar", default: "0.0"
    t.decimal "abr", default: "0.0"
    t.decimal "mai", default: "0.0"
    t.decimal "jun", default: "0.0"
    t.decimal "jul", default: "0.0"
    t.decimal "ago", default: "0.0"
    t.decimal "set", default: "0.0"
    t.decimal "out", default: "0.0"
    t.decimal "nov", default: "0.0"
    t.decimal "dez", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ano_id"], name: "index_proventos_on_ano_id"
    t.index ["carteira_id"], name: "index_proventos_on_carteira_id"
  end

  create_table "sinteticos", force: :cascade do |t|
    t.integer "carteira_id"
    t.integer "ano_id"
    t.decimal "jan", default: "0.0"
    t.decimal "fev", default: "0.0"
    t.decimal "mar", default: "0.0"
    t.decimal "abr", default: "0.0"
    t.decimal "mai", default: "0.0"
    t.decimal "jun", default: "0.0"
    t.decimal "jul", default: "0.0"
    t.decimal "ago", default: "0.0"
    t.decimal "set", default: "0.0"
    t.decimal "out", default: "0.0"
    t.decimal "nov", default: "0.0"
    t.decimal "dez", default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ano_id"], name: "index_sinteticos_on_ano_id"
    t.index ["carteira_id"], name: "index_sinteticos_on_carteira_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.boolean "done"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos", force: :cascade do |t|
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutorials", force: :cascade do |t|
    t.string "title"
    t.boolean "published"
    t.boolean "submitted"
    t.string "description"
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

  create_table "vencimentos", force: :cascade do |t|
    t.date "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "years", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
