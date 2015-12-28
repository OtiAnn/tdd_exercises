require_relative '../working_day_calculator'

RSpec.describe WorkingDayCalculator do
  let(:holiday) { WorkingDayCalculator.new(Date.new(2016,10,10)) }
  let(:work_day) { WorkingDayCalculator.new(Date.new(2016,1,5)) }
  
  describe 'Q1: find on board day' do  
    it 'when holiday choose another on board day' do
      expect(holiday.is_holiday?).to be_truthy
      expect(holiday.set_on_board_day).to eq('2016-10-11')
    end

    it 'when work_day just choose the day on board' do
      expect(work_day.is_holiday?).not_to be_truthy
      expect(work_day.set_on_board_day).to eq('2016-01-05')
    end
  end

  describe 'Q2: find the date in 5 workdays' do
    it 'find the date in 5 workdays' do
      expect(holiday.after_work_days_of(5)).to eq('2016-10-18')
      expect(work_day.after_work_days_of(5)).to eq('2016-01-13')
    end
  end

  describe 'Q3: find last work day' do
    it 'when holiday choose last work day' do
      expect(holiday.is_holiday?).to be_truthy
      expect(holiday.find_last_work_day).to eq('2016-10-07')
    end

    it 'when work_day just choose the day' do
      expect(work_day.is_holiday?).not_to be_truthy
      expect(work_day.find_last_work_day).to eq('2016-01-05')
    end
  end
end
