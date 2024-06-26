# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_29_152258) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_users", force: :cascade do |t|
    t.bigint "account_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_users_on_account_id"
    t.index ["user_id"], name: "index_account_users_on_user_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "addresses", force: :cascade do |t|
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state", default: "NC"
    t.integer "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "country", default: "US"
    t.index ["latitude"], name: "index_addresses_on_latitude"
    t.index ["longitude"], name: "index_addresses_on_longitude"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "prayer_vigil_id", null: false
    t.bigint "prayer_slot_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.index ["prayer_slot_id"], name: "index_bookings_on_prayer_slot_id"
    t.index ["prayer_vigil_id"], name: "index_bookings_on_prayer_vigil_id"
  end

  create_table "churches", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "pastor"
    t.string "church_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pilgrim_id", null: false
    t.index ["pilgrim_id"], name: "index_churches_on_pilgrim_id"
  end

  create_table "editables", force: :cascade do |t|
    t.string "shortname"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shortname"], name: "index_editables_on_shortname", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.bigint "address_id"
    t.string "name"
    t.datetime "start_time"
    t.string "role"
    t.datetime "end_time"
    t.integer "event_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "connected_event_id"
    t.integer "walk_number"
    t.text "description"
    t.index ["address_id"], name: "index_events_on_address_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "media_uploads", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "views_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.index ["slug"], name: "index_media_uploads_on_slug", unique: true
  end

  create_table "message_recipients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "messages_count", default: 0, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "message_recipient_id", null: false
    t.string "name"
    t.string "email"
    t.text "content"
    t.boolean "request_copy", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_recipient_id"], name: "index_messages_on_message_recipient_id"
  end

  create_table "pilgrim_applications", force: :cascade do |t|
    t.string "payment_method"
    t.decimal "payment_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pilgrims", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "street_address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "primary_phone"
    t.string "alternative_phone"
    t.string "work_phone"
    t.string "email"
    t.datetime "date_birth"
    t.string "gender"
    t.string "occupation"
    t.string "nametag_name"
    t.boolean "clergy", default: false
    t.boolean "musician", default: false
    t.string "emergency_name"
    t.string "emergency_relationship"
    t.string "emergency_city"
    t.string "emergency_primary_phone"
    t.string "emergency_alternative_phone"
    t.string "health_condition"
    t.string "physical_limitations"
    t.boolean "medication_time", default: false
    t.text "allergies"
    t.text "walk_explained"
    t.boolean "followup_activities", default: false
    t.text "short_notice"
    t.bigint "pilgrim_application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pilgrim_application_id"], name: "index_pilgrims_on_pilgrim_application_id"
  end

  create_table "poly_actives", force: :cascade do |t|
    t.boolean "active", default: true
    t.string "activatable_type", null: false
    t.bigint "activatable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activatable_type", "activatable_id"], name: "index_poly_actives_on_activatable"
  end

  create_table "prayer_slots", force: :cascade do |t|
    t.datetime "start_time"
    t.bigint "prayer_vigil_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prayer_vigil_id"], name: "index_prayer_slots_on_prayer_vigil_id"
  end

  create_table "prayer_vigils", force: :cascade do |t|
    t.string "title"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "walk_number"
    t.string "slug"
    t.index ["slug"], name: "index_prayer_vigils_on_slug", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  create_table "sponsors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "primary_phone"
    t.string "alternative_phone"
    t.text "church_reunion"
    t.boolean "manage_stairs", default: false
    t.boolean "walking_ramp", default: false
    t.boolean "wheelchairs", default: false
    t.boolean "handicap_shower", default: false
    t.boolean "manage_top_bunk", default: false
    t.text "top_bunk_health"
    t.boolean "reviewed_good_sponsor", default: false
    t.boolean "understand_transportation", default: false
    t.boolean "letter_min", default: false
    t.boolean "must_attend_events", default: false
    t.boolean "followup", default: false
    t.bigint "pilgrim_application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pilgrim_application_id"], name: "index_sponsors_on_pilgrim_application_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id"
    t.string "taggable_type"
    t.bigint "taggable_id"
    t.string "tagger_type"
    t.bigint "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at", precision: nil
    t.string "tenant", limit: 128
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable_type_and_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
    t.index ["tagger_type", "tagger_id"], name: "index_taggings_on_tagger_type_and_tagger_id"
    t.index ["tenant"], name: "index_taggings_on_tenant"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "account_id"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "username"
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id"
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"
    t.index ["user_id"], name: "index_users_roles_on_user_id"
  end

  add_foreign_key "account_users", "accounts"
  add_foreign_key "account_users", "users"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bookings", "prayer_slots"
  add_foreign_key "bookings", "prayer_vigils"
  add_foreign_key "churches", "pilgrims"
  add_foreign_key "events", "addresses"
  add_foreign_key "messages", "message_recipients"
  add_foreign_key "pilgrims", "pilgrim_applications"
  add_foreign_key "prayer_slots", "prayer_vigils"
  add_foreign_key "sponsors", "pilgrim_applications"
  add_foreign_key "taggings", "tags"
  add_foreign_key "users", "accounts"
end
