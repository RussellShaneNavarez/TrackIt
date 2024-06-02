//
//  TransactionManager.swift
//  Esame
//
//  Created by user243601 on 10/19/23.
//

import Foundation
import Combine
import Supabase


class TransactionManager {
    let client = SupabaseClient(supabaseURL: URL(string: "YOUR_SUPABASE_LINK")!, supabaseKey: "YOUR_SUPABASE_KEY")
  
}

struct Transaction: Identifiable, Decodable, Encodable {
    var id: UUID
    let name: String
    let amount: Double
    let createdAt: Date
    let userid: UUID
   
}
