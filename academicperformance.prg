******************************** AcademicPerformance.prg ********
* �������� ������                                               *
* �� ����� "���� ������"                                        *
* ���������� �� ���� ���� � ����� Microsoft Visual FoxPro 9.0"  *
* ��������, ���������, ���������, ����������� �80-307           *
*****************************************************************
*
* �������� ��������� � ��������� ��������� Visual FoxPro
CLEAR MACROS         && ������ ��������� ���������� ������ F1-F12
SET RESOURCE ON      && C�������� ���������
                     && � ������� Foxuser.dbf
SET EXCLUSIVE OFF    && ���� ������ �������� ����
SET MULTILOCKS ON    && ���������� ���������� ������� �����
SET TALK OFF         && �� ���������� ���������� ����������
                     && ������ APPEND, AVERAGE,CALCULATE � ��.
SET DELETED ON       && ���������� � �������� ������ ��������
SET SAFETY OFF       && �� �������� ������ �� �����������
SET STATUS BAR OFF   && �� ���������� ������ ��������� ������
* ����������� ������� �����, ����������� ���������
* FileProc - ��� �����
SET PATH TO DBF,USER,FORM,REPORT,PROGRAM  
SET PROCEDURE TO fileproc   
* ����������� ������� � �����������
* SET PROCEDURE TO <��� �����> ADDITIVE
* SET PROCEDURE TO <��� �����> ADDITIVE
* ���� ������
*SET PATH TO DBF,USER,FORM,ICO,REPORT,PROGRAM  
* ����� ��������� �������� ���������� ����������
DO ADJUSTMENT                 && ��������� � ����� FileProc

* ����������� �������� ���� FOX PRO
_SCREEN.CAPTION=[������������ ���������]
 _SCREEN.Visible = .T.
*_SCREEN.ICON=[Title.ICO]
_SCREEN.MINBUTTON=.T.         && ���� ������ �����������
_SCREEN.MAXBUTTON=.T.         && ���� ������ �������������
_SCREEN.WINDOWTYPE=1          && ��� ����

* �������� ����� ��� ��������� �������
* ���� ����� ��� ������� �� ����������, �� ��������� ������
* � ����� 1961. ��� ����� ����������� ���������� ERRORHND,
* ������� ��������� � ����������� ����� FileProc
* � ������ ���� ������ �������� ����������� � ������
   *-----------------------------------------------------*
   * ����� ��� ��������� ������ C:\WINNT\TEMP �������!   *
   * ����� ��������!                                     *
   *-----------------------------------------------------* 
*MKDIR C:\WINNT             
*MKDIR C:\WINNT\TEMP       
* ����������� �������� �������� ���� ������������ ���������
* � ����������� �� ���������� ������� ������� �������
DO CASE
   CASE SYSMETRIC(1)=1600         && 1600*1280 ��������
       _SCREEN.HEIGHT=1272         
       _SCREEN.WIDTH=1588        
   CASE SYSMETRIC(1)=1280         && 1280*1024 ��������
       _SCREEN.HEIGHT=970         
       _SCREEN.WIDTH=1272         
   CASE SYSMETRIC(1)=1024         && 1024*768 ��������
       _SCREEN.HEIGHT=710         
       _SCREEN.WIDTH=1016        
   CASE SYSMETRIC(1)=800          && 800*600 ��������
       _SCREEN.HEIGHT=540         
       _SCREEN.WIDTH=795          
ENDCASE
_SCREEN.WINDOWSTATE=2    && 2-���������� �� ���� ����� 0-�����
_SCREEN.AUTOCENTER=.F.   && ���������� �� �� ������ ������
_SCREEN.BORDERSTYLE=3    && ���������� ������� �����   
* ���� ����
_SCREEN.BackColor=RGB(192,192,192)         
* ���������� �������� � ������� ���� ������������ ���������
*IF FILE('C:\WINNT\TEMP\PICTURE.JPG')
 *  _SCREEN.PICTURE=[C:\WINNT\TEMP\PICTURE.JPG]
*ENDIF
*_SCREEN.FONTNAME=[ARIAL CYR]            && �����
*_SCREEN.FONTSIZE=9                      && ������ ������
*_SCREEN.ICON=[HOUSE.ICO]                && ������   
* ������������� ������ �� ���������
* ������ ��������� REALQUIT ��� �������� ���� Visual FoxPro
ON SHUTDOWN DO REALQUIT  
DO FORM START            && ��������
DO FORM LOGIN            && ������ ����� �������� �������

IF SuperVisor=.F.
   * ������������� �� ���������
   DO STOP               && ���������� ������
ENDIF
   
IF Administration=.T.
   * ������������� �� ���������
   DO FORM ADMINISTRATION               && ���������� ������
ENDIF
IF Teacher=.T.
   * ������������� �� ���������
   DO FORM TEACHER              && ���������� ������
ENDIF
IF Student=.T.
   * ������������� �� ���������
   DO FORM STUDENT              && ���������� ������
ENDIF
* ������ ����������� ������� Visual FoxPro
READ EVENTS
DO STOP        && ��������� STOP ��������� � ����� FileProc

