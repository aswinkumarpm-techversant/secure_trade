module Api::V1::CsvUploadsHelper
  def export(path)
    n = 0
    CSV.foreach(path, :headers => true) do |row|

      i = Issuer.first
      s = SecurityType.first
      in_freq = InterestFrequency.first
      c = Security.new
      c.issuer_id  = i.id
      c.security_type_id = s.id
      c.interest_frequency_id = in_freq.id
      c.isin = row[2]
      c.security_name = row[3]
      c.face_value = row[4]
      c.coupon_rate = row[5]
      if c.save
        n = n + 1
        GC.start if n % 50 == 0
      end

    end
  end
end
