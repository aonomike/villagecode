module ApplicationHelper

	def get_random_text(number)
		if(number==1)
			return I18n.t 'one'
		elsif(number==2)
			return I18n.t 'two'
		else 
			return I18n.t 'three'
		end
	end
	
	def get_value_from_date(created_at,value)
		
		display=""

		if value=="year"
			display = created_at.to_s.split("-")[0]
		elsif value=="day short_month"
			month = month_name created_at.to_s.split("-")[1].to_s,"short"
			day = created_at.to_s.split("-")[2].split(" ")[0]
			display = day +" " +month
		elsif value=="day long_month"
			month = month_name created_at.to_s.split("-")[1].to_s,"long"
			day = created_at.to_s.split("-")[2].split(" ")[0]
			display = day +" " +month
		elsif value=="month"
			month = month_name created_at.to_s.split("-")[1].to_s,"long"
			display=month
		elsif value=="day/month/year"
			display =created_at.to_s.split("-")[2].split(" ")[0]+"/"+ created_at.to_s.split("-")[1].to_s+"/"+created_at.to_s.split("-")[0]
		elsif value=="long"
			display = get_value_from_date(created_at, "day month")+" "+get_value_from_date(created_at,"year")
		elsif value=="default"
			month = month_name created_at.to_s.split("-")[1].to_s,""
			day = created_at.to_s.split("-")[2].split(" ")[0]
			year = created_at.to_s.split("-")[0]
			display = month+ " "+day+", "+ year
		end

		return display
	end

	def format_code(code,format)
        require 'coderay'

		case format
		when "ruby"
			html = CodeRay.scan(code, :ruby).div(:line_numbers => :table)
			return html
		end
	end

	private
	def month_name(value,form)
		if value=="01"
			if form=="long"
				return "January"
			else
				return "Jan"
			end
		elsif value=='02'
			if form=="long"
				return "February"
			else
				return "Feb"
			end
		elsif value=='03'
			if form=="long"
				return "March"
			else
				return "Mar"
			end
		elsif value=='04'
			if form=="long"
				return "April"
			else
				return "Apr"
			end
		elsif value=='05'
			if form=="long"
				return "May"
			else
				return "May"
			end
		elsif value=='06'
			if form=="long"
				return "June"
			else
				return "Jun"
			end
		elsif value=='07'
			if form=="long"
				return "July"
			else
				return "Jul"
			end
		elsif value=='08'
			if form=="long"
				return "August"
			else
				return "Aug"
			end
		elsif value=='09'
			if form=="long"
				return "September"
			else
				return "Sep"
			end
		elsif value=='10'
			if form=="long"
				return "October"
			else
				return "Oct"
			end
		elsif value=='11'
			if form=="long"
				return "November"
			else
				return "Nov"
			end
		elsif value=='12'
			if form=="long"
				return "December"
			else
				return "Dec"
			end
		end

	end

end
