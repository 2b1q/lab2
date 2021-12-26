import telebot
from telebot import types
from time import gmtime, strftime
from db import getCurrentDaySchedule

d1 = 'понедельник'
d2 = 'вторник'
d3 = 'среда'
d4 = 'четверг'
d5 = 'пятница'

cmd_list = ["/help вывод списка текущих команд\r\n", "/time вывод текущего времени\r\n", "/start начало диалога\r\n", "/mtuci ссылка на сайт МТУСИ"]
joke_list = []

token = '5050194990:AAEgSySZevzZkDVBgGEOn2pz7QZVBfIFIOE'
bot = telebot.TeleBot(token)

# Commands
@bot.message_handler(commands=['start'])
def start(message: types.Message):
    keyboard = types.ReplyKeyboardMarkup(resize_keyboard=True)
    # markup = types.ReplyKeyboardMarkup(resize_keyboard=True)
    item1 = types.KeyboardButton("Понедельник")
    item2 = types.KeyboardButton("Вторник")
    item3 = types.KeyboardButton("Среда")
    item4 = types.KeyboardButton("Четверг")
    item5 = types.KeyboardButton("Пятница")
    item6 = types.KeyboardButton("Расписание на текущую неделю")
    item7 = types.KeyboardButton("Расписание на следующую неделю")
    keyboard.add(item1, item2, item3, item4, item5)
    keyboard.add(item6, item7)
    # keyboard.row("Понедельник", "Вторник", "Среда", "Четверг", "Пятница", "Расписание на текущую неделю", "Расписание на следующую неделю")
    bot.send_message(message.chat.id, 'Добрый день! Выберите расписание', reply_markup=keyboard)

@bot.message_handler(commands=['help'])
def help(message: types.Message):
    bot.send_message(message.chat.id, ''.join(cmd_list))

@bot.message_handler(commands=['time'])
def currentTime(message: types.Message):
    time = strftime("%Y-%m-%d %H:%M:%S", gmtime());
    bot.send_message(message.chat.id, 'Текущее время:\r\n'+time)

@bot.message_handler(commands=['mtuci'])
def currentTime(message: types.Message):
    bot.send_message(message.chat.id, 'https://mtuci.ru')

# Message responses
@bot.message_handler(content_types=['text'])
def answer(message: types.Message):
    msg = message.text.lower()
    print('message: ' + msg)
    if msg == d1:
        bot.send_message(message.chat.id, message.text + '\r\n' + getCurrentDaySchedule(msg))
    if msg == d2:
        bot.send_message(message.chat.id, message.text + '\r\n' + getCurrentDaySchedule(msg))
    if msg == d3:
        bot.send_message(message.chat.id, message.text + '\r\n' + getCurrentDaySchedule(msg))
    if msg == d4:
        bot.send_message(message.chat.id, message.text + '\r\n' + getCurrentDaySchedule(msg))
    if msg == d5:
        bot.send_message(message.chat.id, message.text + '\r\n' + getCurrentDaySchedule(msg))
    if msg == 'расписание на текущую неделю':
        bot.send_message(message.chat.id, d1 + '\r\n' + getCurrentDaySchedule(d1))
        bot.send_message(message.chat.id, d2 + '\r\n' + getCurrentDaySchedule(d2))
        bot.send_message(message.chat.id, d3 + '\r\n' + getCurrentDaySchedule(d3))
        bot.send_message(message.chat.id, d4 + '\r\n' + getCurrentDaySchedule(d4))
        bot.send_message(message.chat.id, d5 + '\r\n' + getCurrentDaySchedule(d5))
    if msg == 'расписание на следующую неделю':
        bot.send_message(message.chat.id, d1 + '\r\n' + getCurrentDaySchedule(d1, True))
        bot.send_message(message.chat.id, d2 + '\r\n' + getCurrentDaySchedule(d2, True))
        bot.send_message(message.chat.id, d3 + '\r\n' + getCurrentDaySchedule(d3, True))
        bot.send_message(message.chat.id, d4 + '\r\n' + getCurrentDaySchedule(d4, True))
        bot.send_message(message.chat.id, d5 + '\r\n' + getCurrentDaySchedule(d5, True))
    else:
        bot.send_message(message.chat.id, "Извините я Вас не понял")

def start():
    bot.infinity_polling()
