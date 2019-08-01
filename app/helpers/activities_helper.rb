module ActivitiesHelper
  def activity_chart_data
    activities_by_day = Activity.avg_group_by_day(3.weeks.ago)
    (3.weeks.ago.to_date..Date.today).map do |date|
      {
        date: date,
        weight: activities_by_day[date].try(:first).try(:avg_weight) || 0
      }
    end
  end
end
