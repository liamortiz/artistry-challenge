class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.order("name")
  end
end
