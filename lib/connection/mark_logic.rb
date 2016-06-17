class Connection::MarkLogic

  def client
    @client ||= ActiveDocument::MarkLogicHTTP.new("http://147.91.177.194:8000", "tim22", "tim22")
  end

  def acts_uri(act)
    "/v1/documents?database=Tim22&uri=/acts/act_#{act.id}.xml"
  end

  def amandments_uri(amandment)
    "/v1/documents?database=Tim22&uri=/amandments/amandment_#{amandment.id}.xml"
  end

  def upload_act(act, act_xml)
    upload(acts_uri(act), act_xml.to_s)
  end

  def upload_amandment(amandment, amandment_xml)
    upload(amandments_uri(amandment), amandment_xml.to_s)
  end

  def download_act(act)
    client.send_corona_request(acts_uri(act))
  end

  private

  def upload(uri, file)
    client.send_corona_request(uri, :put, file)
  end

end
