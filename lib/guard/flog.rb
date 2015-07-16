require 'guard/compat/plugin'
require 'guard'

module Guard
  class Flog < Plugin
    autoload :Flogger, 'guard/flog/flogger'

    def start
      ::Guard::UI.info 'Guard::Flog is running'
    end

    def reload; end

    def run_all
      Flogger.new(@options).flog Dir['./**/*.rb']
    end

    def run_on_changes(paths)
      Flogger.new(@options).flog paths
    end
  end
end
