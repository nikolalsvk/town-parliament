# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)


Role.create!(name: 'citizen')
Role.create!(name: 'alderman')
Role.create!(name: 'assembly_president')

@meeting = Meeting.create(:status => false)
@meeting.save

@act = Act.create(:preambula => "preambula  akta", :name => "akt1", :state => "srbija", :city => "novi sad", :date => "25-05-2016")
2.times do |head|
  @head = Head.create(:act => @act, :name => "naziv glave")
  2.times do |regulation|
    @regulation = Regulation.create(:head => @head, :name => "naziv odredbe", :definition => ">Definicija odredbe akta prvog")
    2.times do |subject|
      @subject = Subject.create(:regulation => @regulation, :name => "naziv predmeta")
      2.times do |clause|
        @clause = Clause.create(:subject => @subject, :name => "naziv claanaaa")
        2.times do |stance|
          @stance = Stance.create(:clause => @clause, :name => "naziv stava")
          2.times do |dot|
            @dot = Dot.create(:stance => @stance, :name => "naziv tacke", :content => "Tacka prvog dokumenta za glavu sa svojim sadrrzajem")
            2.times do |subdot|
              @subdot = Subdot.create(:dot => @dot, :name => "naziv_podtackkeeee", :content => "Podtacka prvog dokumenta za glavu sa svojim sadrzajem")
              3.times do |para|
                @para = Paragraph.create(:subdot => @subdot, :name => "naziv alineje", :content => ">Alineja prvog dokumenta dijela za glavu sa svojim sadrzajem")
              end
            end
          end
        end
      end
    end
  end
end
@act.save

@act = Act.create(:preambula => "preambula  akta", :name => "akt2", :state => "bih", :city => "bijeljina", :date => "26-06-2016")
1.times do |head|
  @head = Head.create(:act => @act, :name => "naziv glave")
  1.times do |regulation|
    @regulation = Regulation.create(:head => @head, :name => "naziv odredbe", :definition => ">Definicija odredbe akta drugog")
    1.times do |subject|
      @subject = Subject.create(:regulation => @regulation, :name => "naziv predmeta")
      1.times do |clause|
        @clause = Clause.create(:subject => @subject, :name => "naziv claanaaa")
        2.times do |stance|
          @stance = Stance.create(:clause => @clause, :name => "naziv stava")
          2.times do |dot|
            @dot = Dot.create(:stance => @stance, :name => "naziv tacke", :content => "Tacka drugog dokumenta za glavu sa svojim sadrrzajem")
            2.times do |subdot|
              @subdot = Subdot.create(:dot => @dot, :name => "naziv_podtackkeeee", :content => "Podtacka drugog dokumenta za glavu sa svojim sadrzajem")
              2.times do |para|
                @para = Paragraph.create(:subdot => @subdot, :name => "naziv alineje", :content => ">Alineja drugog dokumenta dijela za glavu sa svojim sadrzajem")
              end
            end
          end
        end
      end
    end
  end
end
@act.save


@act = Act.create(:preambula => "preambula  akta", :name => "akt3", :state => "hrvatska", :city => "zagreb", :date => "11-07-2016")
1.times do |head|
  @head = Head.create(:act => @act, :name => "naziv glave")
  1.times do |regulation|
    @regulation = Regulation.create(:head => @head, :name => "naziv odredbe", :definition => ">Definicija odredbe akta treceg")
    1.times do |subject|
      @subject = Subject.create(:regulation => @regulation, :name => "naziv predmeta")
      1.times do |clause|
        @clause = Clause.create(:subject => @subject, :name => "naziv claanaaa")
        1.times do |stance|
          @stance = Stance.create(:clause => @clause, :name => "naziv stava")
          1.times do |dot|
            @dot = Dot.create(:stance => @stance, :name => "naziv tacke", :content => "Tacka treceg dokumenta za glavu sa svojim sadrrzajem")
            1.times do |subdot|
              @subdot = Subdot.create(:dot => @dot, :name => "naziv_podtackkeeee", :content => "Podtacka treceg dokumenta za glavu sa svojim sadrzajem")
              3.times do |para|
                @para = Paragraph.create(:subdot => @subdot, :name => "naziv alineje", :content => ">Alineja treceg dokumenta dijela za glavu sa svojim sadrzajem")
              end
            end
          end
        end
      end
    end
  end
end
@act.save

Searchable.create_indexes

Searchable.import_data
