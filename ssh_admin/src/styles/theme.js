import { createMuiTheme } from '@material-ui/core/styles'

export const Theme = createMuiTheme({
  palette: {
      primary: {
          main: '#FEC10E',
      },
      secondary: {
          main: '#F6D796'
      },
      text: {
          main: '#282424'
      },
      background: {
          main: '#ffffff'
      }
  },
  typography: {
      fontFamily: ['Montserrat', 'sans-serif'].join(',')
  }
})