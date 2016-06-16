class Searchable

  CLASSES = [Act, Head, Regulation, Subject, Clause, Dot, Paragraph, Stance, Subdot]

  def self.create_indexes
    CLASSES.each do |c|
      c.__elasticsearch__.create_index! force: true
    end
  end

  def self.import_data
    CLASSES.each do |c|
      c.__elasticsearch__.import
    end
  end

end
