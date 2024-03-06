require "rails_helper"

RSpec.describe EventDecorator, type: :decorator do
  let(:event) { instance_double(Event) }
  let(:decorated_event) { described_class.new(event) }

  describe "#event_title" do
    context 'when event_type is "weekend"' do
      before do
        allow(event).to receive(:event_type).and_return("weekend")
        allow(event).to receive(:name).and_return("Event Name")
        allow(event).to receive(:walk_number).and_return(1)
      end

      it "returns the correct title" do
        expect(decorated_event.event_title).to eq("Event Name 1")
      end

      it "returns the correct date header and address" do
        address = create(:address)
        event = create(:event, event_type: :weekend, address_id: address.id)
        expect(described_class.new(event).event_date_header).to eq(event.start_time.strftime("%A, %B %e, %Y"))
        expect(described_class.new(event).event_address).to eq("#{event.address.city}, #{event.address.state}")
      end
    end

    context 'when event_type is not "weekend"' do
      before do
        allow(event).to receive(:event_type).and_return("weekday")
        allow(event).to receive(:name).and_return("Event Name")
      end

      it "returns the correct title" do
        expect(decorated_event.event_title).to eq("Event Name")
      end
    end
  end

  # Add similar tests for other methods like event_date_header, event_date, event_address, map_link
end
