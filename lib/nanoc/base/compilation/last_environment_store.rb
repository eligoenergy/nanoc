# encoding: utf-8

module Nanoc

  # Stores last environment that was used for compilation.
  #
  # @api private
  class LastEnvironmentStore < ::Nanoc::Store

    def initialize
      # this store is shared by all environments
      super('', 'last_environment', 1)

      @last_environment = ''
    end

    attr_accessor :last_environment

  protected

    # @see Nanoc::Store#data
    def data
      @last_environment
    end

    # @see Nanoc::Store#data=
    def data=(new_data)
      @last_environment = new_data
    end

  end

end
