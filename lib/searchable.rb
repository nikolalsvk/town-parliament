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

  def self.search(params)
    results = Elasticsearch::Model.search(params, CLASSES)

    acts = []

    # Fill an array of acts with acts that contain search word
    results.records.each do |res|
      if res.class.to_s == "Act"
        @act = res
      else
        object = res.class.name.constantize.find(res.id)

        @act = object.act
      end

      acts << @act unless acts.include? @act
    end

    acts
  end

end
