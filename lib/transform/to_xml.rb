class Transform::ToXml

  def self.transform(act)
    new(act).transform
  end

  def initialize(act)
    @akt = act
  end

  def transform
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.akt('naziv' => @akt.name, 'drzava' => @akt.state,'grad' => @akt.city, 'datum' => @akt.date) {
        xml.preambula @akt.preambula
        @akt.heads.each do |h|
          xml.glava('naziv' => h.name, 'kategorija' => h.category) {
            h.regulations.each do |r|
              xml.odredba('naziv' => r.name) {
                xml.definicija r.definition
                r.subjects.each do |s|
                  xml.predmet('naziv' => s.name) {
                    s.clauses.each do |c|
                      xml.clan('naziv' => c.name) {
                        c.stances.each do |st|
                          xml.stav('naziv' => st.name) {
                            xml.sadrzaj st.content
                            st.dots.each do |d|
                              xml.tacka('naziv' => d.name) {
                                xml.sadrzaj d.content
                                d.subdots.each do |sd|
                                  xml.podtacka('naziv' => sd.name) {
                                    xml.sadrzaj sd.content
                                    sd.paragraphs.each do |p|
                                      xml.alineja('naziv' => p.name) {
                                        xml.sadrzaj p.content
                                      }
                                    end
                                  }
                                end
                              }
                            end
                          }
                        end
                      }
                    end
                  }
                end
              }
            end
          }
        end
      }
    end
    @akt = builder.to_xml
  end
end
