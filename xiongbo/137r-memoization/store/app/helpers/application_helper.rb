module ApplicationHelper
  def report_time(code)
    start = Time.now
    result = eval(code)
    finish = Time.now
    render "report", code: code, result: result, time: finish - start
  end
end
