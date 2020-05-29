# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_29_001130) do

  create_table "affiliates", force: :cascade do |t|
    t.integer "reference_id"
    t.string "link"
    t.integer "orderNb"
    t.text "image_data"
  end

  create_table "commentaires", force: :cascade do |t|
    t.integer "utilisateur_id", null: false
    t.integer "reference_id", null: false
    t.integer "note", null: false
    t.text "comment", null: false
  end

  create_table "editeurs", force: :cascade do |t|
    t.string "nom", null: false
  end

  create_table "licencers", force: :cascade do |t|
    t.string "nom", null: false
  end

  create_table "licences", force: :cascade do |t|
    t.string "nom", null: false
    t.integer "licencer_id"
  end

  create_table "listes", force: :cascade do |t|
    t.string "name"
    t.integer "contents_id"
    t.integer "utilisateur_id", null: false
  end

  create_table "references", force: :cascade do |t|
    t.string "titre", limit: 200
    t.string "sousTitre", limit: 50
    t.string "orgTitre"
    t.string "url"
    t.text "synopsis", limit: 3000
    t.integer "licence_id"
    t.decimal "note", precision: 1
    t.boolean "isManga", default: false
    t.boolean "isFr", default: false
    t.string "parStatus"
    t.integer "nbVolFr"
    t.integer "nbVolJp"
    t.integer "edition_id"
    t.boolean "isAnime", default: false
    t.boolean "isLicenced", default: false
    t.string "difStatus"
    t.integer "nbEpTotal"
    t.integer "nbOAVTotal"
    t.integer "nbFilmsTotal"
    t.integer "studio_id"
    t.integer "licencer_id"
    t.boolean "isSponso", default: false, null: false
    t.boolean "isValidated", default: false, null: false
    t.text "cover_data"
  end

  create_table "studios", force: :cascade do |t|
    t.string "nom", null: false
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "password", null: false
    t.integer "NbCom", null: false
    t.string "role", default: "user", null: false
    t.string "bio", default: "Moi aussi, j'ai mon profil sur MDC !"
    t.text "profile_data"
  end

end
