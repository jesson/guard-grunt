require 'guard/compat/plugin'
require 'mkmf'
require 'timeout'

module Guard
  class Grunt < Plugin
    DEFAULT_SIGNAL = :QUIT

    def initialize(options = {})
      @pid = nil
      @grunt_installed = grunt_installed?
      @root ||= options[:root]
      super
    end

    def start
      return unless @grunt_installed
      stop
      UI.info 'Starting grunt...'
      UI.info cmd

      @pid = spawn(env, cmd)
    end

    def stop
      if @pid
        UI.info 'Stopping grunt...'
        UI.info 'Stopped process grunt'
        ::Process.kill DEFAULT_SIGNAL, @pid
        begin
          Timeout.timeout(15) do
            ::Process.wait @pid
          end
        rescue Timeout::Error
          UI.info 'Sending SIGKILL to grunt, as it\'s taking too long to shutdown.'
          ::Process.kill :KILL, @pid
          ::Process.wait @pid
        end
        UI.info 'Stopped process guard'
      end
    rescue Errno::ESRCH
      UI.info 'Guard::Grunt lost the Grunt subprocess!'
    ensure
      @pid = nil
    end

    # Called on Ctrl-Z signal
    def reload
      UI.info 'Restarting grunt...'
      restart
    end

    # Called on file(s) modifications
    def run_on_modifications(paths)
      restart
    end

    def restart
      stop
      start
    end

    private

    def cmd
      if @root
        "cd #{@root} && grunt watch"
      else
        'grunt watch'
      end
    end

    def env
      {}
    end

    def grunt_installed?
      if find_executable 'grunt'
        true
      else
        UI.error 'Please install grunt, http://gruntjs.com/getting-started!'
        false
      end
    end
  end
end
