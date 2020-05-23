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

ActiveRecord::Schema.define(version: 2020_05_22_200755) do

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
  end

  create_table "references", force: :cascade do |t|
    t.string "titre", limit: 200, null: false
    t.string "sousTitre", limit: 50
    t.string "orgTitre", null: false
    t.string "url", null: false
    t.string "imageUrl", null: false
    t.text "synopsis", limit: 3000, null: false
    t.integer "licence_id"
    t.decimal "note", precision: 1
    t.boolean "isManga", null: false
    t.boolean "isFr", null: false
    t.string "parStatus"
    t.integer "nbVolFr"
    t.integer "nbVolJp"
    t.integer "edition_id"
    t.boolean "isAnime", null: false
    t.boolean "isLicenced", null: false
    t.string "difStatus"
    t.integer "nbEpTotal"
    t.integer "nbOAVTotal"
    t.integer "nbFilmsTotal"
    t.integer "studio_id"
    t.integer "licencer_id"
    t.integer "comments_id"
    t.boolean "isSponso", default: false, null: false
    t.boolean "isValidated", default: false, null: false
  end

  create_table "studios", force: :cascade do |t|
    t.string "nom", null: false
  end

  create_table "utilisateurs", force: :cascade do |t|
    t.string "email", null: false
    t.string "username", null: false
    t.string "password", null: false
    t.string "pdpUrl", null: false
    t.integer "NbCom", null: false
    t.integer "listes_id"
  end

end
