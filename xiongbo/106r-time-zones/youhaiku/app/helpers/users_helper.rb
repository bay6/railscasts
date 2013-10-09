module UsersHelper
  def china_zones
    @china_zones ||= ActiveSupport::TimeZone.all.find_all { |z| z.name =~ /Beijing|Hong kong|Chongqing|Taipei/ }
  end
end
