//
//  DatabaseManager.swift
//  Esame
//
//  Created by user243601 on 10/17/23.
//
import Foundation
import Supabase

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private init() {}
    
    let client = SupabaseClient(supabaseURL: URL(string: "xxxxxxx")!, supabaseKey: "xxxxxx")
    
    func createToDoItem(item: Transaction) async throws {
        let response = try await client.database.from("transaction").insert(values: item).execute()
        print(response)
        print(response.status)
        print(response.underlyingResponse.data)
    }
    
    func fetchToDoItems(for uid: String) async throws -> [Transaction] {
        let response = try await client.database.from("todos").select().equals(column: "user_uid", value: uid).order(column: "created_at", ascending: true).execute()
        let data = response.underlyingResponse.data
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let todos = try decoder.decode([Transaction].self, from: data)
        return todos
    }
    
    func deleteToDoItem(id: Int) async throws {
        let response = try await client.database.from("todos").delete().eq(column: "id", value: id).execute()
        print(response)
        print(response.status)
        print(String(data: response.underlyingResponse.data, encoding: .utf8) ?? <#default value#>!)
    }
    
}
