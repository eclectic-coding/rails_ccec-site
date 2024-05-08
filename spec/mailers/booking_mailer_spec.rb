require "rails_helper"

RSpec.describe BookingMailer, type: :mailer do
  describe "booking_confirmation" do
    let(:event) { create(:event, :weekend, start_time: Time.zone.now) }
    let(:prayer_vigil) { PrayerVigil.find_by(walk_number: event.walk_number) }
    let(:booking) { create(:booking, prayer_vigil: prayer_vigil, prayer_slot: prayer_vigil.prayer_slots.first) }

    context "headers" do
      it "renders the subject" do
        mail = described_class.booking_confirmation(booking)

        expect(mail.subject).to eq I18n.t('booking_mailer.booking_confirmation.booking_confirmation', walk_number: booking.prayer_vigil.walk_number)
      end

      it "renders the receiver email" do
        mail = described_class.booking_confirmation(booking)

        expect(mail.to).to eq([booking.email])
      end

      it "renders the sender email" do
        mail = described_class.booking_confirmation(booking)

        expect(mail.from).to eq(["info@#{Rails.application.credentials.domain_name}"])
      end
    end
  end
end
