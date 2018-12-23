*****************************************************************
* Процедурный файл к учебному примеру Real Estate               *
* Содержит ряд процедур, необходимых для работы                 *
* программного комплекса                                        *
* Подключен к RealEstate.prg командой SET PROCEDURE TO FileProc *
*****************************************************************

PROCEDURE STOP            && Завершение работы комплекса
* Возвращение настроек однопользовательского режима
* Это режим разработчика программного комплекса  
  ON KEY LABEL ESCAPE     && Вернуть к действию клавишу ESC
  DEACTIVATE WINDOW ALL
  RELEASE WINDOW ALL
  SET RESOURCE ON         && Сохранять настройки
                          && в таблице Foxuser.dbf
  _SCREEN.BACKCOLOR=RGB(255,255,255) && Вернуть стандартный фон
  _SCREEN.WINDOWSTATE=2              && Развернуть во весь экран
  _SCREEN.MINBUTTON=.T.              && Есть кнопка свертывания
  _SCREEN.MAXBUTTON=.T.              && Есть кнопка развертывания
  _SCREEN.PICTURE=[]                 && Убрать картинку   
  _SCREEN.ICON=[]                    && Убрать иконку
  * Вернуть заголовок экрана
  _SCREEN.CAPTION=[Microsoft Visual FoxPro] 
  * Вернуть файл справки Visual FoxPro
* SET HELP TO
  ON SHUTDOWN             && Спец. команды, выполняющиеся
                          && после выхода из Visual FoxPro
  RELEASE ALL EXTENDED    && Удалить из памяти переменные
  SET EXCLUSIVE ON        && Монопольный доступ
  SET DELETED OFF         && Удаленные записи видимы
  SET TALK ON             && Выводить результаты 
                          && выполнения команд на экран
  SET SAFETY ON           && Отображать предупреждающее сообщение
                          && перед перезаписью файла
  SET STATUS BAR ON       && Отображать нижнюю строку экрана  
  ON ERROR                && Вернуть стандартную процедуру
                          && обработки ошибок
  SET SYSMENU TO DEFAULT  && Вернуть системное меню FoxPro
  CLOSE DATABASES ALL     && Закрыть базы данных
  CLOSE TABLES ALL        && Закрыть свободные таблицы
  CANCEL                  && Завершение выполнения FoxPro-программы
RETURN

PROCEDURE REALQUIT        && Подтверждение выхода из FoxPro
LOCAL lnMsgResult
lnMsgResult=MESSAGEBOX('Вы действительно хотите выйти из программы?',;
                        20,' Выход из программы ')
IF lnMsgResult=6      && Кнопка Да
    QUIT              && Завершение работы среды Visual FoxPro
ENDIF                             
RETURN

*PROCEDURE ERRORHND            && Процедура обработки ошибок


PROCEDURE ADJUSTMENT          && Описание глобальных переменных
PUBLIC VersionFoxPro          && Версия FoxPro
VersionFoxPro=PADR(VERSION(),16)
PUBLIC DISK                   && Папка, из которой запушен комплекс
DISK=SYS(5)+SYS(2003)
* Задержка при пошаговом поиске в секундах
_DblClick=0.5       
PUBLIC LOGIN                 && Фамилия работника
LOGIN = 0
PUBLIC SuperVisor             && Признак идентификации
Supervisor = .F.


* Глобальные переменные для доступа к пунктам меню и кнопкам форм
PUBLIC Administration, Teacher, Student
STORE .F. TO Administration, Teacher, Student
RETURN

PUBLIC is_add
is_add = .F.


Function CrKod               && Зашифровка пароля
PARAMETERS cPassword
PRIVAT cLetter,cEncryptedPassword
cPassword=RTRIM(cPassword)
cEncryptedPassword=[]
FOR I=1 TO LEN(cPassword)
    cLetter=SUBSTR(cPassword,i,1)
    cEncryptedPassword=cEncryptedPassword+CHR(ASC(cLetter)-I)   
NEXT I
RETURN cEncryptedPassword


Function UnKod               && Расшифровка пароля
PARAMETERS cEncryptedPassword
PRIVAT cLetter,cPassword
cEncryptedPassword=RTRIM(cEncryptedPassword)
cPassword=[]
FOR I=1 TO LEN(cEncryptedPassword)
  cLetter=SUBSTR(cEncryptedPassword,i,1)
  cPassword=cPassword+CHR(ASC(cLetter)+I)     
NEXT I
RETURN cPassword
