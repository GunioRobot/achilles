def severify(options)
  options[:location_id]       = Location.find_or_create_by_name(options.delete(:location)).id             if options[:location]
  options[:classification_id] = Classification.find_or_create_by_name(options.delete(:classification)).id if options[:classification]
  options[:severity_id]       = Severity.find_or_create_by_name(options.delete(:as)).id                   if options[:as]
  
  fail unless options[:location_id] &&
              options[:classification_id] &&
              options[:severity_id]
  
  vulnerability_severity = VulnerabilitySeverity.find(:first, :conditions => { :location_id => options[:location_id], 
                                                                               :classification_id => options[:classification_id] })

  if vulnerability_severity
    ActiveRecord::Base.connection.execute "UPDATE vulnerability_severities SET severity_id = #{options[:severity_id]} WHERE location_id = #{options[:location_id]} AND classification_id = #{options[:classification_id]}"
  else
    ActiveRecord::Base.connection.execute "INSERT INTO vulnerability_severities (severity_id, location_id, classification_id) VALUES (#{options[:severity_id]}, #{options[:location_id]}, #{options[:classification_id]})"
  end
end

severify :location => 'Academic - Dynamic',       :classification => 'Compromised',               :as => 'Critical'
severify :location => 'Academic - Dynamic',       :classification => 'Data Corruption',           :as => 'Low'
severify :location => 'Academic - Dynamic',       :classification => 'Data Disclosure - Full',    :as => 'High'
severify :location => 'Academic - Dynamic',       :classification => 'Data Disclosure - Partial', :as => 'Medium'
severify :location => 'Academic - Dynamic',       :classification => 'Degradation - Service',     :as => 'Low'
severify :location => 'Academic - Dynamic',       :classification => 'Degradation - System',      :as => 'Low'
severify :location => 'Academic - Dynamic',       :classification => 'DoS - Service',             :as => 'Low'
severify :location => 'Academic - Dynamic',       :classification => 'DoS - System',              :as => 'Low'
severify :location => 'Academic - Dynamic',       :classification => 'Full Control - Local',      :as => 'Low'
severify :location => 'Academic - Dynamic',       :classification => 'Full Control - Remote',     :as => 'High'
severify :location => 'Academic - Dynamic',       :classification => 'System Info Disclosure',    :as => 'Low'
severify :location => 'Academic - Dynamic',       :classification => 'System User Access',        :as => 'Medium'
severify :location => 'Academic - Fixed',         :classification => 'Compromised',               :as => 'Critical'
severify :location => 'Academic - Fixed',         :classification => 'Data Corruption',           :as => 'Medium'
severify :location => 'Academic - Fixed',         :classification => 'Data Disclosure - Full',    :as => 'High'
severify :location => 'Academic - Fixed',         :classification => 'Data Disclosure - Partial', :as => 'High'
severify :location => 'Academic - Fixed',         :classification => 'Degradation - Service',     :as => 'Medium'
severify :location => 'Academic - Fixed',         :classification => 'Degradation - System',      :as => 'Medium'
severify :location => 'Academic - Fixed',         :classification => 'DoS - Service',             :as => 'Medium'
severify :location => 'Academic - Fixed',         :classification => 'DoS - System',              :as => 'Medium'
severify :location => 'Academic - Fixed',         :classification => 'Full Control - Local',      :as => 'Medium'
severify :location => 'Academic - Fixed',         :classification => 'Full Control - Remote',     :as => 'High'
severify :location => 'Academic - Fixed',         :classification => 'System Info Disclosure',    :as => 'Low'
severify :location => 'Academic - Fixed',         :classification => 'System User Access',        :as => 'High'
severify :location => 'Administrative - Dynamic', :classification => 'Compromised',               :as => 'Critical'
severify :location => 'Administrative - Dynamic', :classification => 'Data Corruption',           :as => 'Low'
severify :location => 'Administrative - Dynamic', :classification => 'Data Disclosure - Full',    :as => 'High'
severify :location => 'Administrative - Dynamic', :classification => 'Data Disclosure - Partial', :as => 'Medium'
severify :location => 'Administrative - Dynamic', :classification => 'Degradation - Service',     :as => 'Low'
severify :location => 'Administrative - Dynamic', :classification => 'Degradation - System',      :as => 'Low'
severify :location => 'Administrative - Dynamic', :classification => 'DoS - Service',             :as => 'Low'
severify :location => 'Administrative - Dynamic', :classification => 'DoS - System',              :as => 'Low'
severify :location => 'Administrative - Dynamic', :classification => 'Full Control - Local',      :as => 'Low'
severify :location => 'Administrative - Dynamic', :classification => 'Full Control - Remote',     :as => 'High'
severify :location => 'Administrative - Dynamic', :classification => 'System Info Disclosure',    :as => 'Low'
severify :location => 'Administrative - Dynamic', :classification => 'System User Access',        :as => 'Medium'
severify :location => 'Administrative - Fixed',   :classification => 'Compromised',               :as => 'Critical'
severify :location => 'Administrative - Fixed',   :classification => 'Data Corruption',           :as => 'Medium'
severify :location => 'Administrative - Fixed',   :classification => 'Data Disclosure - Full',    :as => 'High'
severify :location => 'Administrative - Fixed',   :classification => 'Data Disclosure - Partial', :as => 'High'
severify :location => 'Administrative - Fixed',   :classification => 'Degradation - Service',     :as => 'Medium'
severify :location => 'Administrative - Fixed',   :classification => 'Degradation - System',      :as => 'Medium'
severify :location => 'Administrative - Fixed',   :classification => 'DoS - Service',             :as => 'Medium'
severify :location => 'Administrative - Fixed',   :classification => 'DoS - System',              :as => 'Medium'
severify :location => 'Administrative - Fixed',   :classification => 'Full Control - Local',      :as => 'Medium'
severify :location => 'Administrative - Fixed',   :classification => 'Full Control - Remote',     :as => 'High'
severify :location => 'Administrative - Fixed',   :classification => 'System Info Disclosure',    :as => 'Low'
severify :location => 'Administrative - Fixed',   :classification => 'System User Access',        :as => 'High'
severify :location => 'Kiewit - Critical',        :classification => 'Compromised',               :as => 'Critical'
severify :location => 'Kiewit - Critical',        :classification => 'Data Corruption',           :as => 'Critical'
severify :location => 'Kiewit - Critical',        :classification => 'Data Disclosure - Full',    :as => 'Critical'
severify :location => 'Kiewit - Critical',        :classification => 'Data Disclosure - Partial', :as => 'Critical'
severify :location => 'Kiewit - Critical',        :classification => 'Degradation - Service',     :as => 'High'
severify :location => 'Kiewit - Critical',        :classification => 'Degradation - System',      :as => 'High'
severify :location => 'Kiewit - Critical',        :classification => 'DoS - Service',             :as => 'High'
severify :location => 'Kiewit - Critical',        :classification => 'DoS - System',              :as => 'High'
severify :location => 'Kiewit - Critical',        :classification => 'Full Control - Local',      :as => 'High'
severify :location => 'Kiewit - Critical',        :classification => 'Full Control - Remote',     :as => 'Critical'
severify :location => 'Kiewit - Critical',        :classification => 'System Info Disclosure',    :as => 'Medium'
severify :location => 'Kiewit - Critical',        :classification => 'System User Access',        :as => 'Critical'
severify :location => 'Residential',              :classification => 'Compromised',               :as => 'High'
severify :location => 'Residential',              :classification => 'Data Corruption',           :as => 'Low'
severify :location => 'Residential',              :classification => 'Data Disclosure - Full',    :as => 'Medium'
severify :location => 'Residential',              :classification => 'Data Disclosure - Partial', :as => 'Medium'
severify :location => 'Residential',              :classification => 'Degradation - Service',     :as => 'Low'
severify :location => 'Residential',              :classification => 'Degradation - System',      :as => 'Low'
severify :location => 'Residential',              :classification => 'DoS - Service',             :as => 'Low'
severify :location => 'Residential',              :classification => 'DoS - System',              :as => 'Low'
severify :location => 'Residential',              :classification => 'Full Control - Local',      :as => 'Low'
severify :location => 'Residential',              :classification => 'Full Control - Remote',     :as => 'Medium'
severify :location => 'Residential',              :classification => 'System Info Disclosure',    :as => 'Low'
severify :location => 'Residential',              :classification => 'System User Access',        :as => 'Low'
severify :location => 'VOIP',                     :classification => 'Compromised',               :as => 'Critical'
severify :location => 'VOIP',                     :classification => 'Data Corruption',           :as => 'High'
severify :location => 'VOIP',                     :classification => 'Data Disclosure - Full',    :as => 'High'
severify :location => 'VOIP',                     :classification => 'Data Disclosure - Partial', :as => 'High'
severify :location => 'VOIP',                     :classification => 'Degradation - Service',     :as => 'High'
severify :location => 'VOIP',                     :classification => 'Degradation - System',      :as => 'High'
severify :location => 'VOIP',                     :classification => 'DoS - Service',             :as => 'High'
severify :location => 'VOIP',                     :classification => 'DoS - System',              :as => 'High'
severify :location => 'VOIP',                     :classification => 'Full Control - Local',      :as => 'High'
severify :location => 'VOIP',                     :classification => 'Full Control - Remote',     :as => 'High'
severify :location => 'VOIP',                     :classification => 'System Info Disclosure',    :as => 'Medium'
severify :location => 'VOIP',                     :classification => 'System User Access',        :as => 'High'
severify :location => 'Wireless',                 :classification => 'Compromised',               :as => 'High'
severify :location => 'Wireless',                 :classification => 'Data Corruption',           :as => 'Low'
severify :location => 'Wireless',                 :classification => 'Data Disclosure - Full',    :as => 'Medium'
severify :location => 'Wireless',                 :classification => 'Data Disclosure - Partial', :as => 'Medium'
severify :location => 'Wireless',                 :classification => 'Degradation - Service',     :as => 'Low'
severify :location => 'Wireless',                 :classification => 'Degradation - System',      :as => 'Low'
severify :location => 'Wireless',                 :classification => 'DoS - Service',             :as => 'Low'
severify :location => 'Wireless',                 :classification => 'DoS - System',              :as => 'Low'
severify :location => 'Wireless',                 :classification => 'Full Control - Local',      :as => 'Low'
severify :location => 'Wireless',                 :classification => 'Full Control - Remote',     :as => 'Medium'
severify :location => 'Wireless',                 :classification => 'System Info Disclosure',    :as => 'Low'
severify :location => 'Wireless',                 :classification => 'System User Access',        :as => 'Low'
