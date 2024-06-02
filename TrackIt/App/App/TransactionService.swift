//
//  TransactionService.swift
//  Esame
//
//  Created by user243601 on 10/22/23.
//

import Foundation
import Supabase

class TransactionService: ObservableObject {
    let client = SupabaseClient(supabaseURL: URL(string: "YOUR_SUPABASE_LINK")!, supabaseKey: "YOUR_SUPABASE_KEY")
    
    func getData() async -> [Transaction] {
        let query = client
            .database
            .from("transaction")
            .select()
        
        let resp: [Transaction] = try! await query.execute().value
    
        print("getData = \(resp)")
        
        return resp
    }
    func createData(id: UUID, name: String, amount: Double, createdAt: Date, userid: UUID) async {
        let data = Transaction(id: id, name: name, amount: amount, createdAt: createdAt, userid: userid)
        
        let query = client
            .database
            .from("transaction")
            .insert(values: data)
        
        do {
            try await query.execute()
            // Transaction successfully created
            print("Transaction created successfully.")
        } catch {
            // Handle the error
            print("Error creating transaction: \(error)")
        }
    }


    func deleteData(id: UUID) async {
        let query = client
            .database
            .from("transaction")
            .delete()
            .eq(column: "id", value: id)
        
        print("deleteData = \(query)")
        
        try! await query.execute()
    }

}

