require 'Date'

class WorkingDayCalculator
  attr_accessor :date

  def initialize(date_object)
    @date = date_object
  end

  def is_holiday?
    holiday? @date
  end

  def is_workday?
    (holiday? @date) ? false : true
  end

  def set_on_board_day
    while holiday? @date
      @date += 1
    end
    return @date.to_s
  end

  def after_work_days_of num
    @date = @date.next_day
    while num > 0
      if !holiday? @date
        num -= 1
      end
      @date += 1
    end
    return @date.to_s
  end

  def find_last_work_day
    while holiday? @date
      @date -= 1
    end
    return @date.to_s
  end

  private

  def holiday? date
    holidays = [
      '2016-01-01',
      '2016-02-08',
      '2016-02-09',
      '2016-02-10',
      '2016-02-11',
      '2016-02-12',
      '2016-02-29',
      '2016-04-05',
      '2016-06-10',
      '2016-09-16',
      '2016-10-10'
    ]
    date.saturday? || date.sunday? || holidays.include?(date.to_s)
  end
end
