/** @jsxRuntime automatic */
import { Routes, Route } from 'react-router-dom'
import DealsTable from './pages/DealsTable'

export default function App() {
  return (
    <Routes>
      <Route path="/" element={<DealsTable />} />
    </Routes>
  )
}
