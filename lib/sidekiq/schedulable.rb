module Sidekiq
  module Schedulable
    def self.included(klass)
      klass.extend(ClassMethods)
    end

    module ClassMethods
      def sidekiq_schedule(schedule, options = {})
        SidekiqSchedulable.schedules[self.to_s] = {
          worker: self,
          crons: Array(schedule),
          options: options
        }
      end
    end
  end
end
