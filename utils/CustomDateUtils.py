from datetime import datetime, timezone, timedelta

from dateutil.relativedelta import relativedelta


class CustomDateUtils:

    @staticmethod
    def subtract_periods_from_current_date(unit, quantity):
        """
            Subtrai uma quantidade especificada de unidades de tempo do datetime atual, dada uma unidade de tempo.

            Argumentos:
                unit (str): Uma string representando a unidade de tempo a ser subtraída, por ex. 'months', 'days', 'hours', etc.
                quantity (Union[int, float]): A quantidade de unidades de tempo a subtrair.

            Retorna:
                str: Uma representação de string da nova data e hora no formato '%d/%m/%Y %H:%M'.
        """
        current_date = datetime.now(timezone(timedelta(hours=-3)))
        new_date = current_date - relativedelta(**{unit: int(quantity)})

        return new_date.strftime('%d/%m/%Y %H:%M')
