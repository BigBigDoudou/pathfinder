module ValidationHelper
  def serial_error
    {
      error: 'missing or invalid serial',
      text: 'Serial is missing or is not a string.'
    }
  end

  def width_error
    {
      error: 'missing or invalid width',
      text: 'Width is missing or is not a positive integer.'
    }
  end

  def allowed_characters_error
    {
      error: 'forbidden characters',
      text: 'Forbidden characters found in the serial. '\
            'You should use only S (for start), F (for finish), '\
            'W (for wall) and P (for path).'
    }
  end

  def start_and_finish_error
    {
      error: 'error with start and/or finish',
      text: 'You should indicate one only one start (S) and finish (F).'
    }
  end

  def rectangle_error
    {
      error: 'not rectangle',
      text: 'The maze is not rectangle. '\
            'Width should be a dividor of the serial length. '\
            'For example, if you want a maze of 8 columns and 6 rows, '\
            'provide a serial with 48 (8 * 6) characters and a width of 8.'
    }
  end

  def regex_characters
    /\A[SFPW]+\z/
  end

  def regex_start
    /\A[FPW]*[S]{1}[FPW]*\z/
  end

  def regex_finish
    /\A[SPW]*[F]{1}[SPW]*\z/
  end
end
