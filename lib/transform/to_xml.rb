class Transform::ToXml

  def self.transform(act)
    new(act).transform
  end

  def initialize(act)
    @akt = act
  end

  def transform
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.akt {
        xml.preambula @akt.preambula
        @akt.heads.each do |h|

          xml.glava {

            h.regulations.each do |r|
              xml.odredba {
                xml.definicija r.definition
                r.subjects.each do |s|
                  xml.predmet {
                    s.clauses.each do |c|
                      xml.clan {
                        c.stances.each do |st|
                          xml.stav {
                            xml.sadrzaj st.content
                            st.dots.each do |d|
                              xml.tacka {
                                xml.sadrzaj d.content
                                d.subdots.each do |sd|
                                  xml.podtacka {
                                    xml.sadrzaj sd.content

                                    alineja(sd, xml)
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

  def alineja(subdot, xml)
    subdot.paragraphs.each do |p|
      xml.alineja {
        xml.sadrzaj p.content
      }
    end
  end

end
