from sqlalchemy import create_engine

db_name = 'mtuci'
db_user = 'mtuci'
db_pass = 'secret'
db_host = 'schedule-db'
db_port = '5432'

dsn = 'postgresql://{}:{}@{}:{}/{}'.format(db_user, db_pass, db_host, db_port, db_name)
db = create_engine(dsn)

base_query = "SELECT t.room_number, t.start_time, s.name as subject, t2.full_name FROM timetable t " +\
             "LEFT JOIN subject s " +\
             "ON t.subject_id = s.id " +\
             "LEFT JOIN teacher t2 " +\
             "ON t2.subject_id = s.id "

def getCurrentDaySchedule(currentDay: str, nextWeek = False) -> str:
    query = base_query + "WHERE t.day = '" + currentDay + "'"
    query += "AND t.start_time > now()" if nextWeek else "AND t.start_time < now()"

    result_set = db.execute(query)

    str = ''
    for r in result_set:
        print(r)
        str += '_____________________________________________________________\r\n' +\
               'Предмет: ' + r[2] + ' \r\n' +\
               'Кабинет: ' + r[0] + '\r\n' +\
               'Время: ' + r[1].strftime("%m/%d/%Y, %H:%M:%S") + '\r\n' +\
               'Перподаватель: ' + r[3] + '\r\n'
    return str