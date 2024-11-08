from datetime import datetime
import pytz

def get_current_time_in_timezone(timezone):
    tz = pytz.timezone(timezone)
    return datetime.now(tz).strftime('%Y-%m-%d %H:%M:%S')