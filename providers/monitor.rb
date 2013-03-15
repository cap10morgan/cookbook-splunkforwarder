def whyrun_supported?
  true
end

def splunk_home
  '/opt/splunkforwarder'
end

def splunk_cmd
  "#{splunk_home}/bin/splunk"
end

def splunk_monitors
  `#{splunk_cmd} list monitor`.split(/\n\s*/)
end

action :add do
  execute "add splunk monitor" do
    not_if { splunk_monitors.include?(new_resource.name) }
    command "#{splunk_cmd} add monitor #{new_resource.name}"
  end
end

action :remove do
  execute "remove splunk monitor" do
    only_if { splunk_monitors.include?(new_resource.name) }
    command "#{splunk_cmd} remove monitor #{new_resource.name}"
  end
end
