require 'rxsd'

xsd_uris = [ "file:///home/nikolalsvk/Documents/town-parliment/xml_schema/amandman.xsd",
             "file:///home/nikolalsvk/Documents/town-parliment/xml_schema/akt.xsd" ]

xsd_uris.each do |xsd_uri|
  schema = RXSD::Parser.parse_xsd :uri => xsd_uri

  puts "=======Classes======="
  classes = schema.to :ruby_classes
  puts classes.collect{ |cl| !cl.nil? ? (cl.to_s + " < " + cl.superclass.to_s) : ""}.sort.join("\n")

  puts "=======Tags======="
  puts schema.tags.collect { |n,cb| n + ": " + cb.to_s + ": " + (cb.nil? ? "ncb" : cb.klass_name.to_s + "-" + cb.klass.to_s) }.sort.join("\n")
end
