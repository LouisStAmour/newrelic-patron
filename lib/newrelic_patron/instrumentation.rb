require 'patron'
if defined?(::Patron) and not NewRelic::Control.instance['disable_patron'] and not ENV['NEWRELIC_ENABLE'].to_s =~ /false|off|no/i
    ::Patron::Session.class_eval do
      def request_with_newrelic_trace(action, url, headers, options = {})
        newrelic_host = parse_host_for_newrelic url
        metrics = ["External/#{newrelic_host}/Patron::Connection/#{action}", "External/#{newrelic_host}/all", "External/all"]
        if NewRelic::Agent::Transaction.recording_web_transaction?
          metrics << "External/allWeb"
        else
          metrics << "External/allOther"
        end
        self.class.trace_execution_scoped metrics do
          request_without_newrelic_trace(action, url, headers, options)
        end
      end
      alias request_without_newrelic_trace request
      alias request request_with_newrelic_trace

      def parse_host_for_newrelic(url)
        begin
          URI.parse(base_url.empty? ? url : File.join(base_url, url)).host.to_s
        rescue
          ''
        end
      end
    end
end
