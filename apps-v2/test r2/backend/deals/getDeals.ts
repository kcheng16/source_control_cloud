export type Deal = {
  id: string
  deal_name: string
  email: string
  amount: number
  stage: string
  owner_id: string
  created_at: string
  updated_at: string
}

export default async function () {
  const result = await retoolDb.query<Deal>(
    'SELECT id, deal_name, email, amount, stage, owner_id, created_at, updated_at FROM deals ORDER BY amount DESC'
  )
  return result.data
}
