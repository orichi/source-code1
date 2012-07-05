class ActivitiesSubjects < ActiveRecord::Migration
  def self.up
    create_table :activities_subjects , :id =>false do |t|
      t.integer :activity_id
      t.integer :subject_id
    end
  end

  def self.down
    drop_table :activities_subjects
  end
end
