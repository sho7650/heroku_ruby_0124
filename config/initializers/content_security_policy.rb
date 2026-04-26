# Be sure to restart your server when you modify this file.

Rails.application.config.content_security_policy do |policy|
  policy.default_src :self, :https
  policy.font_src    :self, :https, :data
  policy.img_src     :self, :https, :data
  policy.object_src  :none
  policy.script_src  :self, :https
  policy.style_src   :self, :https
  policy.base_uri    :self
  policy.frame_ancestors :none
end

# Start in report-only mode so we can observe before enforcing.
# Flip to false (or remove this line) once we've confirmed no violations.
Rails.application.config.content_security_policy_report_only = true
