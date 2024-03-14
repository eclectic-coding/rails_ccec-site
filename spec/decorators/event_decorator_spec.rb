require "rails_helper"

RSpec.describe EventDecorator, type: :decorator do
  let!(:event) { instance_double(Event) }
  let!(:decorated_event) { described_class.new(event) }

  describe "#decorate_collection" do
    let(:events) { [instance_double(Event), instance_double(Event)] }
    let(:decorated_collection) { described_class.decorate_collection(events) }

    it "returns a collection of decorated events" do
      decorated_collection.each do |decorated_event|
        expect(decorated_event).to be_a(described_class)
      end
    end
  end

  describe "#event_title" do
    context 'when event_type is "weekend"' do
      before do
        allow(event).to receive(:event_type).and_return("weekend")
        allow(event).to receive(:name).and_return("Event Name")
        allow(event).to receive(:walk_number).and_return(1)
        allow_any_instance_of(Address).to receive(:geocode).and_return([1,1])
      end

      it "does not make a request to the geocoding API" do
        address = build(:address)
        stub_request(:any, /maps.googleapis.com/).to_return(status: 200, body: "", headers: {})

        address.geocode

        expect(a_request(:any, /maps.googleapis.com/)).not_to have_been_made
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

      it "returns the correct event date" do
        event = create(:event, event_type: :weekend)
        expect(described_class.new(event).event_date).to eq(event.start_time.strftime("%A, %B %e, %Y"))
      end

      it "return a map link" do
        event = create(:event, event_type: :weekend, address: create(:address))
        expect(described_class.new(event).map_link).to eq("https://www.google.com/maps/@#{event.address.latitude},#{event.address.longitude},15z?hl=en-US&entry=ttu")
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
end
