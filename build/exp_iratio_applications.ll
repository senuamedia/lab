; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"iratio_3task"(i64 %w0, i64 %w1, i64 %w2, i64 %w3) nounwind {
entry:
  %local.ga0.9 = alloca i64
  %local.ga1.10 = alloca i64
  %local.ga2.11 = alloca i64
  %local.ga3.12 = alloca i64
  %local.gb0.13 = alloca i64
  %local.gb1.14 = alloca i64
  %local.gb2.15 = alloca i64
  %local.gb3.16 = alloca i64
  %local.gc0.17 = alloca i64
  %local.gc1.18 = alloca i64
  %local.gc2.19 = alloca i64
  %local.gc3.20 = alloca i64
  %local.d_ab.21 = alloca i64
  %local.d_ac.22 = alloca i64
  %local.d_bc.23 = alloca i64
  %local.cross.24 = alloca i64
  %local.na.25 = alloca i64
  %local.nb.26 = alloca i64
  %local.nc.27 = alloca i64
  %local.ind.28 = alloca i64
  %local.w0 = alloca i64
  store i64 %w0, ptr %local.w0
  %local.w1 = alloca i64
  store i64 %w1, ptr %local.w1
  %local.w2 = alloca i64
  store i64 %w2, ptr %local.w2
  %local.w3 = alloca i64
  store i64 %w3, ptr %local.w3
  %t29 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.2)
  %t30 = load i64, ptr %local.w0
  %t31 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.3)
  %t32 = call i64 @"sx_f64_sub"(i64 %t30, i64 %t31)
  %t33 = call i64 @"sx_f64_mul"(i64 %t29, i64 %t32)
  store i64 %t33, ptr %local.ga0.9
  %t34 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.4)
  %t35 = load i64, ptr %local.w1
  %t36 = call i64 @"sx_f64_mul"(i64 %t34, i64 %t35)
  store i64 %t36, ptr %local.ga1.10
  %t37 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.5)
  %t38 = load i64, ptr %local.w2
  %t39 = call i64 @"sx_f64_mul"(i64 %t37, i64 %t38)
  store i64 %t39, ptr %local.ga2.11
  %t40 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.6)
  %t41 = load i64, ptr %local.w3
  %t42 = call i64 @"sx_f64_mul"(i64 %t40, i64 %t41)
  store i64 %t42, ptr %local.ga3.12
  %t43 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.7)
  %t44 = load i64, ptr %local.w0
  %t45 = call i64 @"sx_f64_mul"(i64 %t43, i64 %t44)
  store i64 %t45, ptr %local.gb0.13
  %t46 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.8)
  %t47 = load i64, ptr %local.w1
  %t48 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.9)
  %t49 = call i64 @"sx_f64_sub"(i64 %t47, i64 %t48)
  %t50 = call i64 @"sx_f64_mul"(i64 %t46, i64 %t49)
  store i64 %t50, ptr %local.gb1.14
  %t51 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.10)
  %t52 = load i64, ptr %local.w2
  %t53 = call i64 @"sx_f64_mul"(i64 %t51, i64 %t52)
  store i64 %t53, ptr %local.gb2.15
  %t54 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.11)
  %t55 = load i64, ptr %local.w3
  %t56 = call i64 @"sx_f64_mul"(i64 %t54, i64 %t55)
  store i64 %t56, ptr %local.gb3.16
  %t57 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.12)
  %t58 = load i64, ptr %local.w0
  %t59 = call i64 @"sx_f64_mul"(i64 %t57, i64 %t58)
  store i64 %t59, ptr %local.gc0.17
  %t60 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.13)
  %t61 = load i64, ptr %local.w1
  %t62 = call i64 @"sx_f64_mul"(i64 %t60, i64 %t61)
  store i64 %t62, ptr %local.gc1.18
  %t63 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.14)
  %t64 = load i64, ptr %local.w2
  %t65 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.15)
  %t66 = call i64 @"sx_f64_sub"(i64 %t64, i64 %t65)
  %t67 = call i64 @"sx_f64_mul"(i64 %t63, i64 %t66)
  store i64 %t67, ptr %local.gc2.19
  %t68 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.16)
  %t69 = load i64, ptr %local.w3
  %t70 = call i64 @"sx_f64_mul"(i64 %t68, i64 %t69)
  store i64 %t70, ptr %local.gc3.20
  %t71 = load i64, ptr %local.ga0.9
  %t72 = load i64, ptr %local.gb0.13
  %t73 = call i64 @"sx_f64_mul"(i64 %t71, i64 %t72)
  %t74 = load i64, ptr %local.ga1.10
  %t75 = load i64, ptr %local.gb1.14
  %t76 = call i64 @"sx_f64_mul"(i64 %t74, i64 %t75)
  %t77 = call i64 @"sx_f64_add"(i64 %t73, i64 %t76)
  %t78 = load i64, ptr %local.ga2.11
  %t79 = load i64, ptr %local.gb2.15
  %t80 = call i64 @"sx_f64_mul"(i64 %t78, i64 %t79)
  %t81 = call i64 @"sx_f64_add"(i64 %t77, i64 %t80)
  %t82 = load i64, ptr %local.ga3.12
  %t83 = load i64, ptr %local.gb3.16
  %t84 = call i64 @"sx_f64_mul"(i64 %t82, i64 %t83)
  %t85 = call i64 @"sx_f64_add"(i64 %t81, i64 %t84)
  store i64 %t85, ptr %local.d_ab.21
  %t86 = load i64, ptr %local.ga0.9
  %t87 = load i64, ptr %local.gc0.17
  %t88 = call i64 @"sx_f64_mul"(i64 %t86, i64 %t87)
  %t89 = load i64, ptr %local.ga1.10
  %t90 = load i64, ptr %local.gc1.18
  %t91 = call i64 @"sx_f64_mul"(i64 %t89, i64 %t90)
  %t92 = call i64 @"sx_f64_add"(i64 %t88, i64 %t91)
  %t93 = load i64, ptr %local.ga2.11
  %t94 = load i64, ptr %local.gc2.19
  %t95 = call i64 @"sx_f64_mul"(i64 %t93, i64 %t94)
  %t96 = call i64 @"sx_f64_add"(i64 %t92, i64 %t95)
  %t97 = load i64, ptr %local.ga3.12
  %t98 = load i64, ptr %local.gc3.20
  %t99 = call i64 @"sx_f64_mul"(i64 %t97, i64 %t98)
  %t100 = call i64 @"sx_f64_add"(i64 %t96, i64 %t99)
  store i64 %t100, ptr %local.d_ac.22
  %t101 = load i64, ptr %local.gb0.13
  %t102 = load i64, ptr %local.gc0.17
  %t103 = call i64 @"sx_f64_mul"(i64 %t101, i64 %t102)
  %t104 = load i64, ptr %local.gb1.14
  %t105 = load i64, ptr %local.gc1.18
  %t106 = call i64 @"sx_f64_mul"(i64 %t104, i64 %t105)
  %t107 = call i64 @"sx_f64_add"(i64 %t103, i64 %t106)
  %t108 = load i64, ptr %local.gb2.15
  %t109 = load i64, ptr %local.gc2.19
  %t110 = call i64 @"sx_f64_mul"(i64 %t108, i64 %t109)
  %t111 = call i64 @"sx_f64_add"(i64 %t107, i64 %t110)
  %t112 = load i64, ptr %local.gb3.16
  %t113 = load i64, ptr %local.gc3.20
  %t114 = call i64 @"sx_f64_mul"(i64 %t112, i64 %t113)
  %t115 = call i64 @"sx_f64_add"(i64 %t111, i64 %t114)
  store i64 %t115, ptr %local.d_bc.23
  %t116 = load i64, ptr %local.d_ab.21
  %t117 = load i64, ptr %local.d_ac.22
  %t118 = call i64 @"sx_f64_add"(i64 %t116, i64 %t117)
  %t119 = load i64, ptr %local.d_bc.23
  %t120 = call i64 @"sx_f64_add"(i64 %t118, i64 %t119)
  store i64 %t120, ptr %local.cross.24
  %t121 = load i64, ptr %local.ga0.9
  %t122 = load i64, ptr %local.ga0.9
  %t123 = call i64 @"sx_f64_mul"(i64 %t121, i64 %t122)
  %t124 = load i64, ptr %local.ga1.10
  %t125 = load i64, ptr %local.ga1.10
  %t126 = call i64 @"sx_f64_mul"(i64 %t124, i64 %t125)
  %t127 = call i64 @"sx_f64_add"(i64 %t123, i64 %t126)
  %t128 = load i64, ptr %local.ga2.11
  %t129 = load i64, ptr %local.ga2.11
  %t130 = call i64 @"sx_f64_mul"(i64 %t128, i64 %t129)
  %t131 = call i64 @"sx_f64_add"(i64 %t127, i64 %t130)
  %t132 = load i64, ptr %local.ga3.12
  %t133 = load i64, ptr %local.ga3.12
  %t134 = call i64 @"sx_f64_mul"(i64 %t132, i64 %t133)
  %t135 = call i64 @"sx_f64_add"(i64 %t131, i64 %t134)
  store i64 %t135, ptr %local.na.25
  %t136 = load i64, ptr %local.gb0.13
  %t137 = load i64, ptr %local.gb0.13
  %t138 = call i64 @"sx_f64_mul"(i64 %t136, i64 %t137)
  %t139 = load i64, ptr %local.gb1.14
  %t140 = load i64, ptr %local.gb1.14
  %t141 = call i64 @"sx_f64_mul"(i64 %t139, i64 %t140)
  %t142 = call i64 @"sx_f64_add"(i64 %t138, i64 %t141)
  %t143 = load i64, ptr %local.gb2.15
  %t144 = load i64, ptr %local.gb2.15
  %t145 = call i64 @"sx_f64_mul"(i64 %t143, i64 %t144)
  %t146 = call i64 @"sx_f64_add"(i64 %t142, i64 %t145)
  %t147 = load i64, ptr %local.gb3.16
  %t148 = load i64, ptr %local.gb3.16
  %t149 = call i64 @"sx_f64_mul"(i64 %t147, i64 %t148)
  %t150 = call i64 @"sx_f64_add"(i64 %t146, i64 %t149)
  store i64 %t150, ptr %local.nb.26
  %t151 = load i64, ptr %local.gc0.17
  %t152 = load i64, ptr %local.gc0.17
  %t153 = call i64 @"sx_f64_mul"(i64 %t151, i64 %t152)
  %t154 = load i64, ptr %local.gc1.18
  %t155 = load i64, ptr %local.gc1.18
  %t156 = call i64 @"sx_f64_mul"(i64 %t154, i64 %t155)
  %t157 = call i64 @"sx_f64_add"(i64 %t153, i64 %t156)
  %t158 = load i64, ptr %local.gc2.19
  %t159 = load i64, ptr %local.gc2.19
  %t160 = call i64 @"sx_f64_mul"(i64 %t158, i64 %t159)
  %t161 = call i64 @"sx_f64_add"(i64 %t157, i64 %t160)
  %t162 = load i64, ptr %local.gc3.20
  %t163 = load i64, ptr %local.gc3.20
  %t164 = call i64 @"sx_f64_mul"(i64 %t162, i64 %t163)
  %t165 = call i64 @"sx_f64_add"(i64 %t161, i64 %t164)
  store i64 %t165, ptr %local.nc.27
  %t166 = load i64, ptr %local.na.25
  %t167 = load i64, ptr %local.nb.26
  %t168 = call i64 @"sx_f64_add"(i64 %t166, i64 %t167)
  %t169 = load i64, ptr %local.nc.27
  %t170 = call i64 @"sx_f64_add"(i64 %t168, i64 %t169)
  store i64 %t170, ptr %local.ind.28
  %t171 = load i64, ptr %local.ind.28
  %t172 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.17)
  %t173 = call i64 @"sx_f64_lt"(i64 %t171, i64 %t172)
  %t174 = icmp ne i64 %t173, 0
  br i1 %t174, label %then1, label %else1
then1:
  %t175 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.18)
  ret i64 %t175
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t176 = phi i64 [ 0, %else1_end ]
  %t177 = load i64, ptr %local.cross.24
  %t178 = load i64, ptr %local.ind.28
  %t179 = call i64 @"sx_f64_div"(i64 %t177, i64 %t178)
  ret i64 %t179
}

define i64 @"test_multitask"() nounwind {
entry:
  %local.w0.180 = alloca i64
  %local.w1.181 = alloca i64
  %local.w2.182 = alloca i64
  %local.w3.183 = alloca i64
  %local.step.184 = alloca i64
  %local.g0.185 = alloca i64
  %local.g1.186 = alloca i64
  %local.g2.187 = alloca i64
  %local.g3.188 = alloca i64
  %local.ir.189 = alloca i64
  %local.g0.190 = alloca i64
  %local.g1.191 = alloca i64
  %local.g2.192 = alloca i64
  %local.g3.193 = alloca i64
  %local.ir.194 = alloca i64
  %t195 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.19)
  %t196 = ptrtoint ptr %t195 to i64
  %t197 = inttoptr i64 %t196 to ptr
  call void @intrinsic_println(ptr %t197)
  %t198 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.20)
  %t199 = ptrtoint ptr %t198 to i64
  %t200 = inttoptr i64 %t199 to ptr
  call void @intrinsic_println(ptr %t200)
  %t201 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.21)
  %t202 = ptrtoint ptr %t201 to i64
  %t203 = inttoptr i64 %t202 to ptr
  call void @intrinsic_println(ptr %t203)
  %t204 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.22)
  %t205 = ptrtoint ptr %t204 to i64
  %t206 = inttoptr i64 %t205 to ptr
  call void @intrinsic_println(ptr %t206)
  %t207 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.23)
  store i64 %t207, ptr %local.w0.180
  %t208 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.24)
  store i64 %t208, ptr %local.w1.181
  %t209 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.25)
  store i64 %t209, ptr %local.w2.182
  %t210 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.26)
  store i64 %t210, ptr %local.w3.183
  store i64 0, ptr %local.step.184
  %t211 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.27)
  %t212 = ptrtoint ptr %t211 to i64
  %t213 = inttoptr i64 %t212 to ptr
  call void @intrinsic_println(ptr %t213)
  br label %loop2
loop2:
  %t214 = load i64, ptr %local.step.184
  %t215 = icmp slt i64 %t214, 300
  %t216 = zext i1 %t215 to i64
  %t217 = icmp ne i64 %t216, 0
  br i1 %t217, label %body2, label %endloop2
body2:
  %t218 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.28)
  %t219 = load i64, ptr %local.w0.180
  %t220 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.29)
  %t221 = call i64 @"sx_f64_sub"(i64 %t219, i64 %t220)
  %t222 = call i64 @"sx_f64_mul"(i64 %t218, i64 %t221)
  %t223 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.30)
  %t224 = load i64, ptr %local.w0.180
  %t225 = call i64 @"sx_f64_mul"(i64 %t223, i64 %t224)
  %t226 = call i64 @"sx_f64_add"(i64 %t222, i64 %t225)
  %t227 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.31)
  %t228 = load i64, ptr %local.w0.180
  %t229 = call i64 @"sx_f64_mul"(i64 %t227, i64 %t228)
  %t230 = call i64 @"sx_f64_add"(i64 %t226, i64 %t229)
  store i64 %t230, ptr %local.g0.185
  %t231 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.32)
  %t232 = load i64, ptr %local.w1.181
  %t233 = call i64 @"sx_f64_mul"(i64 %t231, i64 %t232)
  %t234 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.33)
  %t235 = load i64, ptr %local.w1.181
  %t236 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.34)
  %t237 = call i64 @"sx_f64_sub"(i64 %t235, i64 %t236)
  %t238 = call i64 @"sx_f64_mul"(i64 %t234, i64 %t237)
  %t239 = call i64 @"sx_f64_add"(i64 %t233, i64 %t238)
  %t240 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.35)
  %t241 = load i64, ptr %local.w1.181
  %t242 = call i64 @"sx_f64_mul"(i64 %t240, i64 %t241)
  %t243 = call i64 @"sx_f64_add"(i64 %t239, i64 %t242)
  store i64 %t243, ptr %local.g1.186
  %t244 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.36)
  %t245 = load i64, ptr %local.w2.182
  %t246 = call i64 @"sx_f64_mul"(i64 %t244, i64 %t245)
  %t247 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.37)
  %t248 = load i64, ptr %local.w2.182
  %t249 = call i64 @"sx_f64_mul"(i64 %t247, i64 %t248)
  %t250 = call i64 @"sx_f64_add"(i64 %t246, i64 %t249)
  %t251 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.38)
  %t252 = load i64, ptr %local.w2.182
  %t253 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.39)
  %t254 = call i64 @"sx_f64_sub"(i64 %t252, i64 %t253)
  %t255 = call i64 @"sx_f64_mul"(i64 %t251, i64 %t254)
  %t256 = call i64 @"sx_f64_add"(i64 %t250, i64 %t255)
  store i64 %t256, ptr %local.g2.187
  %t257 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.40)
  %t258 = load i64, ptr %local.w3.183
  %t259 = call i64 @"sx_f64_mul"(i64 %t257, i64 %t258)
  %t260 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.41)
  %t261 = load i64, ptr %local.w3.183
  %t262 = call i64 @"sx_f64_mul"(i64 %t260, i64 %t261)
  %t263 = call i64 @"sx_f64_add"(i64 %t259, i64 %t262)
  %t264 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.42)
  %t265 = load i64, ptr %local.w3.183
  %t266 = call i64 @"sx_f64_mul"(i64 %t264, i64 %t265)
  %t267 = call i64 @"sx_f64_add"(i64 %t263, i64 %t266)
  store i64 %t267, ptr %local.g3.188
  %t268 = load i64, ptr %local.w0.180
  %t269 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.43)
  %t270 = load i64, ptr %local.g0.185
  %t271 = call i64 @"sx_f64_mul"(i64 %t269, i64 %t270)
  %t272 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.44)
  %t273 = call i64 @"sx_f64_div"(i64 %t271, i64 %t272)
  %t274 = call i64 @"sx_f64_sub"(i64 %t268, i64 %t273)
  store i64 %t274, ptr %local.w0.180
  %t275 = load i64, ptr %local.w1.181
  %t276 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.45)
  %t277 = load i64, ptr %local.g1.186
  %t278 = call i64 @"sx_f64_mul"(i64 %t276, i64 %t277)
  %t279 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.46)
  %t280 = call i64 @"sx_f64_div"(i64 %t278, i64 %t279)
  %t281 = call i64 @"sx_f64_sub"(i64 %t275, i64 %t280)
  store i64 %t281, ptr %local.w1.181
  %t282 = load i64, ptr %local.w2.182
  %t283 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.47)
  %t284 = load i64, ptr %local.g2.187
  %t285 = call i64 @"sx_f64_mul"(i64 %t283, i64 %t284)
  %t286 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.48)
  %t287 = call i64 @"sx_f64_div"(i64 %t285, i64 %t286)
  %t288 = call i64 @"sx_f64_sub"(i64 %t282, i64 %t287)
  store i64 %t288, ptr %local.w2.182
  %t289 = load i64, ptr %local.w3.183
  %t290 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.49)
  %t291 = load i64, ptr %local.g3.188
  %t292 = call i64 @"sx_f64_mul"(i64 %t290, i64 %t291)
  %t293 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.50)
  %t294 = call i64 @"sx_f64_div"(i64 %t292, i64 %t293)
  %t295 = call i64 @"sx_f64_sub"(i64 %t289, i64 %t294)
  store i64 %t295, ptr %local.w3.183
  %t296 = load i64, ptr %local.w0.180
  %t297 = load i64, ptr %local.w1.181
  %t298 = load i64, ptr %local.w2.182
  %t299 = load i64, ptr %local.w3.183
  %t300 = call i64 @"iratio_3task"(i64 %t296, i64 %t297, i64 %t298, i64 %t299)
  store i64 %t300, ptr %local.ir.189
  %t301 = load i64, ptr %local.step.184
  %t302 = icmp eq i64 %t301, 0
  %t303 = zext i1 %t302 to i64
  %t304 = icmp ne i64 %t303, 0
  br i1 %t304, label %then3, label %else3
then3:
  %t305 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.51)
  %t306 = ptrtoint ptr %t305 to i64
  %t307 = inttoptr i64 %t306 to ptr
  call void @intrinsic_print(ptr %t307)
  %t308 = load i64, ptr %local.w0.180
  %t309 = call i64 @"print_f64"(i64 %t308)
  %t310 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.52)
  %t311 = ptrtoint ptr %t310 to i64
  %t312 = inttoptr i64 %t311 to ptr
  call void @intrinsic_print(ptr %t312)
  %t313 = load i64, ptr %local.w1.181
  %t314 = call i64 @"print_f64"(i64 %t313)
  %t315 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.53)
  %t316 = ptrtoint ptr %t315 to i64
  %t317 = inttoptr i64 %t316 to ptr
  call void @intrinsic_print(ptr %t317)
  %t318 = load i64, ptr %local.w2.182
  %t319 = call i64 @"print_f64"(i64 %t318)
  %t320 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.54)
  %t321 = ptrtoint ptr %t320 to i64
  %t322 = inttoptr i64 %t321 to ptr
  call void @intrinsic_print(ptr %t322)
  %t323 = load i64, ptr %local.ir.189
  %t324 = call i64 @"print_f64"(i64 %t323)
  %t325 = load i64, ptr %local.ir.189
  %t326 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.55)
  %t327 = call i64 @"sx_f64_add"(i64 %t325, i64 %t326)
  %t328 = call i64 @"abs_f64"(i64 %t327)
  %t329 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.56)
  %t330 = call i64 @"sx_f64_lt"(i64 %t328, i64 %t329)
  %t331 = icmp ne i64 %t330, 0
  br i1 %t331, label %then4, label %else4
then4:
  %t332 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.57)
  %t333 = ptrtoint ptr %t332 to i64
  %t334 = inttoptr i64 %t333 to ptr
  call void @intrinsic_println(ptr %t334)
  br label %then4_end
then4_end:
  br label %endif4
else4:
  %t335 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.58)
  %t336 = ptrtoint ptr %t335 to i64
  %t337 = inttoptr i64 %t336 to ptr
  call void @intrinsic_println(ptr %t337)
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t338 = phi i64 [ 0, %then4_end ], [ 0, %else4_end ]
  br label %then3_end
then3_end:
  br label %endif3
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t339 = phi i64 [ %t338, %then3_end ], [ 0, %else3_end ]
  %t340 = load i64, ptr %local.step.184
  %t341 = icmp eq i64 %t340, 10
  %t342 = zext i1 %t341 to i64
  %t343 = icmp ne i64 %t342, 0
  br i1 %t343, label %then5, label %else5
then5:
  %t344 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.59)
  %t345 = ptrtoint ptr %t344 to i64
  %t346 = inttoptr i64 %t345 to ptr
  call void @intrinsic_print(ptr %t346)
  %t347 = load i64, ptr %local.w0.180
  %t348 = call i64 @"print_f64"(i64 %t347)
  %t349 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.60)
  %t350 = ptrtoint ptr %t349 to i64
  %t351 = inttoptr i64 %t350 to ptr
  call void @intrinsic_print(ptr %t351)
  %t352 = load i64, ptr %local.w1.181
  %t353 = call i64 @"print_f64"(i64 %t352)
  %t354 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.61)
  %t355 = ptrtoint ptr %t354 to i64
  %t356 = inttoptr i64 %t355 to ptr
  call void @intrinsic_print(ptr %t356)
  %t357 = load i64, ptr %local.w2.182
  %t358 = call i64 @"print_f64"(i64 %t357)
  %t359 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.62)
  %t360 = ptrtoint ptr %t359 to i64
  %t361 = inttoptr i64 %t360 to ptr
  call void @intrinsic_print(ptr %t361)
  %t362 = load i64, ptr %local.ir.189
  %t363 = call i64 @"print_f64"(i64 %t362)
  %t364 = load i64, ptr %local.ir.189
  %t365 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.63)
  %t366 = call i64 @"sx_f64_add"(i64 %t364, i64 %t365)
  %t367 = call i64 @"abs_f64"(i64 %t366)
  %t368 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.64)
  %t369 = call i64 @"sx_f64_lt"(i64 %t367, i64 %t368)
  %t370 = icmp ne i64 %t369, 0
  br i1 %t370, label %then6, label %else6
then6:
  %t371 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.65)
  %t372 = ptrtoint ptr %t371 to i64
  %t373 = inttoptr i64 %t372 to ptr
  call void @intrinsic_println(ptr %t373)
  br label %then6_end
then6_end:
  br label %endif6
else6:
  %t374 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.66)
  %t375 = ptrtoint ptr %t374 to i64
  %t376 = inttoptr i64 %t375 to ptr
  call void @intrinsic_println(ptr %t376)
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t377 = phi i64 [ 0, %then6_end ], [ 0, %else6_end ]
  br label %then5_end
then5_end:
  br label %endif5
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t378 = phi i64 [ %t377, %then5_end ], [ 0, %else5_end ]
  %t379 = load i64, ptr %local.step.184
  %t380 = icmp eq i64 %t379, 50
  %t381 = zext i1 %t380 to i64
  %t382 = icmp ne i64 %t381, 0
  br i1 %t382, label %then7, label %else7
then7:
  %t383 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.67)
  %t384 = ptrtoint ptr %t383 to i64
  %t385 = inttoptr i64 %t384 to ptr
  call void @intrinsic_print(ptr %t385)
  %t386 = load i64, ptr %local.w0.180
  %t387 = call i64 @"print_f64"(i64 %t386)
  %t388 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.68)
  %t389 = ptrtoint ptr %t388 to i64
  %t390 = inttoptr i64 %t389 to ptr
  call void @intrinsic_print(ptr %t390)
  %t391 = load i64, ptr %local.w1.181
  %t392 = call i64 @"print_f64"(i64 %t391)
  %t393 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.69)
  %t394 = ptrtoint ptr %t393 to i64
  %t395 = inttoptr i64 %t394 to ptr
  call void @intrinsic_print(ptr %t395)
  %t396 = load i64, ptr %local.w2.182
  %t397 = call i64 @"print_f64"(i64 %t396)
  %t398 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.70)
  %t399 = ptrtoint ptr %t398 to i64
  %t400 = inttoptr i64 %t399 to ptr
  call void @intrinsic_print(ptr %t400)
  %t401 = load i64, ptr %local.ir.189
  %t402 = call i64 @"print_f64"(i64 %t401)
  %t403 = load i64, ptr %local.ir.189
  %t404 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.71)
  %t405 = call i64 @"sx_f64_add"(i64 %t403, i64 %t404)
  %t406 = call i64 @"abs_f64"(i64 %t405)
  %t407 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.72)
  %t408 = call i64 @"sx_f64_lt"(i64 %t406, i64 %t407)
  %t409 = icmp ne i64 %t408, 0
  br i1 %t409, label %then8, label %else8
then8:
  %t410 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.73)
  %t411 = ptrtoint ptr %t410 to i64
  %t412 = inttoptr i64 %t411 to ptr
  call void @intrinsic_println(ptr %t412)
  br label %then8_end
then8_end:
  br label %endif8
else8:
  %t413 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.74)
  %t414 = ptrtoint ptr %t413 to i64
  %t415 = inttoptr i64 %t414 to ptr
  call void @intrinsic_println(ptr %t415)
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t416 = phi i64 [ 0, %then8_end ], [ 0, %else8_end ]
  br label %then7_end
then7_end:
  br label %endif7
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t417 = phi i64 [ %t416, %then7_end ], [ 0, %else7_end ]
  %t418 = load i64, ptr %local.step.184
  %t419 = icmp eq i64 %t418, 100
  %t420 = zext i1 %t419 to i64
  %t421 = icmp ne i64 %t420, 0
  br i1 %t421, label %then9, label %else9
then9:
  %t422 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.75)
  %t423 = ptrtoint ptr %t422 to i64
  %t424 = inttoptr i64 %t423 to ptr
  call void @intrinsic_print(ptr %t424)
  %t425 = load i64, ptr %local.w0.180
  %t426 = call i64 @"print_f64"(i64 %t425)
  %t427 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.76)
  %t428 = ptrtoint ptr %t427 to i64
  %t429 = inttoptr i64 %t428 to ptr
  call void @intrinsic_print(ptr %t429)
  %t430 = load i64, ptr %local.w1.181
  %t431 = call i64 @"print_f64"(i64 %t430)
  %t432 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.77)
  %t433 = ptrtoint ptr %t432 to i64
  %t434 = inttoptr i64 %t433 to ptr
  call void @intrinsic_print(ptr %t434)
  %t435 = load i64, ptr %local.w2.182
  %t436 = call i64 @"print_f64"(i64 %t435)
  %t437 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.78)
  %t438 = ptrtoint ptr %t437 to i64
  %t439 = inttoptr i64 %t438 to ptr
  call void @intrinsic_print(ptr %t439)
  %t440 = load i64, ptr %local.ir.189
  %t441 = call i64 @"print_f64"(i64 %t440)
  %t442 = load i64, ptr %local.ir.189
  %t443 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.79)
  %t444 = call i64 @"sx_f64_add"(i64 %t442, i64 %t443)
  %t445 = call i64 @"abs_f64"(i64 %t444)
  %t446 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.80)
  %t447 = call i64 @"sx_f64_lt"(i64 %t445, i64 %t446)
  %t448 = icmp ne i64 %t447, 0
  br i1 %t448, label %then10, label %else10
then10:
  %t449 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.81)
  %t450 = ptrtoint ptr %t449 to i64
  %t451 = inttoptr i64 %t450 to ptr
  call void @intrinsic_println(ptr %t451)
  br label %then10_end
then10_end:
  br label %endif10
else10:
  %t452 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.82)
  %t453 = ptrtoint ptr %t452 to i64
  %t454 = inttoptr i64 %t453 to ptr
  call void @intrinsic_println(ptr %t454)
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t455 = phi i64 [ 0, %then10_end ], [ 0, %else10_end ]
  br label %then9_end
then9_end:
  br label %endif9
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t456 = phi i64 [ %t455, %then9_end ], [ 0, %else9_end ]
  %t457 = load i64, ptr %local.step.184
  %t458 = icmp eq i64 %t457, 299
  %t459 = zext i1 %t458 to i64
  %t460 = icmp ne i64 %t459, 0
  br i1 %t460, label %then11, label %else11
then11:
  %t461 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.83)
  %t462 = ptrtoint ptr %t461 to i64
  %t463 = inttoptr i64 %t462 to ptr
  call void @intrinsic_print(ptr %t463)
  %t464 = load i64, ptr %local.w0.180
  %t465 = call i64 @"print_f64"(i64 %t464)
  %t466 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.84)
  %t467 = ptrtoint ptr %t466 to i64
  %t468 = inttoptr i64 %t467 to ptr
  call void @intrinsic_print(ptr %t468)
  %t469 = load i64, ptr %local.w1.181
  %t470 = call i64 @"print_f64"(i64 %t469)
  %t471 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.85)
  %t472 = ptrtoint ptr %t471 to i64
  %t473 = inttoptr i64 %t472 to ptr
  call void @intrinsic_print(ptr %t473)
  %t474 = load i64, ptr %local.w2.182
  %t475 = call i64 @"print_f64"(i64 %t474)
  %t476 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.86)
  %t477 = ptrtoint ptr %t476 to i64
  %t478 = inttoptr i64 %t477 to ptr
  call void @intrinsic_print(ptr %t478)
  %t479 = load i64, ptr %local.ir.189
  %t480 = call i64 @"print_f64"(i64 %t479)
  %t481 = load i64, ptr %local.ir.189
  %t482 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.87)
  %t483 = call i64 @"sx_f64_add"(i64 %t481, i64 %t482)
  %t484 = call i64 @"abs_f64"(i64 %t483)
  %t485 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.88)
  %t486 = call i64 @"sx_f64_lt"(i64 %t484, i64 %t485)
  %t487 = icmp ne i64 %t486, 0
  br i1 %t487, label %then12, label %else12
then12:
  %t488 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.89)
  %t489 = ptrtoint ptr %t488 to i64
  %t490 = inttoptr i64 %t489 to ptr
  call void @intrinsic_println(ptr %t490)
  br label %then12_end
then12_end:
  br label %endif12
else12:
  %t491 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.90)
  %t492 = ptrtoint ptr %t491 to i64
  %t493 = inttoptr i64 %t492 to ptr
  call void @intrinsic_println(ptr %t493)
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t494 = phi i64 [ 0, %then12_end ], [ 0, %else12_end ]
  br label %then11_end
then11_end:
  br label %endif11
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t495 = phi i64 [ %t494, %then11_end ], [ 0, %else11_end ]
  %t496 = load i64, ptr %local.step.184
  %t497 = add i64 %t496, 1
  store i64 %t497, ptr %local.step.184
  br label %loop2
endloop2:
  %t498 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.91)
  %t499 = ptrtoint ptr %t498 to i64
  %t500 = inttoptr i64 %t499 to ptr
  call void @intrinsic_println(ptr %t500)
  %t501 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.92)
  %t502 = ptrtoint ptr %t501 to i64
  %t503 = inttoptr i64 %t502 to ptr
  call void @intrinsic_println(ptr %t503)
  %t504 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.93)
  store i64 %t504, ptr %local.w0.180
  %t505 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.94)
  store i64 %t505, ptr %local.w1.181
  %t506 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.95)
  store i64 %t506, ptr %local.w2.182
  %t507 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.96)
  store i64 %t507, ptr %local.w3.183
  store i64 0, ptr %local.step.184
  br label %loop13
loop13:
  %t508 = load i64, ptr %local.step.184
  %t509 = icmp slt i64 %t508, 300
  %t510 = zext i1 %t509 to i64
  %t511 = icmp ne i64 %t510, 0
  br i1 %t511, label %body13, label %endloop13
body13:
  %t512 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.97)
  %t513 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.98)
  %t514 = call i64 @"sx_f64_mul"(i64 %t512, i64 %t513)
  %t515 = load i64, ptr %local.w0.180
  %t516 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.99)
  %t517 = call i64 @"sx_f64_sub"(i64 %t515, i64 %t516)
  %t518 = call i64 @"sx_f64_mul"(i64 %t514, i64 %t517)
  %t519 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.100)
  %t520 = load i64, ptr %local.w0.180
  %t521 = call i64 @"sx_f64_mul"(i64 %t519, i64 %t520)
  %t522 = call i64 @"sx_f64_add"(i64 %t518, i64 %t521)
  %t523 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.101)
  %t524 = load i64, ptr %local.w0.180
  %t525 = call i64 @"sx_f64_mul"(i64 %t523, i64 %t524)
  %t526 = call i64 @"sx_f64_add"(i64 %t522, i64 %t525)
  store i64 %t526, ptr %local.g0.190
  %t527 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.102)
  %t528 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.103)
  %t529 = call i64 @"sx_f64_mul"(i64 %t527, i64 %t528)
  %t530 = load i64, ptr %local.w1.181
  %t531 = call i64 @"sx_f64_mul"(i64 %t529, i64 %t530)
  %t532 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.104)
  %t533 = load i64, ptr %local.w1.181
  %t534 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.105)
  %t535 = call i64 @"sx_f64_sub"(i64 %t533, i64 %t534)
  %t536 = call i64 @"sx_f64_mul"(i64 %t532, i64 %t535)
  %t537 = call i64 @"sx_f64_add"(i64 %t531, i64 %t536)
  %t538 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.106)
  %t539 = load i64, ptr %local.w1.181
  %t540 = call i64 @"sx_f64_mul"(i64 %t538, i64 %t539)
  %t541 = call i64 @"sx_f64_add"(i64 %t537, i64 %t540)
  store i64 %t541, ptr %local.g1.191
  %t542 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.107)
  %t543 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.108)
  %t544 = call i64 @"sx_f64_mul"(i64 %t542, i64 %t543)
  %t545 = load i64, ptr %local.w2.182
  %t546 = call i64 @"sx_f64_mul"(i64 %t544, i64 %t545)
  %t547 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.109)
  %t548 = load i64, ptr %local.w2.182
  %t549 = call i64 @"sx_f64_mul"(i64 %t547, i64 %t548)
  %t550 = call i64 @"sx_f64_add"(i64 %t546, i64 %t549)
  %t551 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.110)
  %t552 = load i64, ptr %local.w2.182
  %t553 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.111)
  %t554 = call i64 @"sx_f64_sub"(i64 %t552, i64 %t553)
  %t555 = call i64 @"sx_f64_mul"(i64 %t551, i64 %t554)
  %t556 = call i64 @"sx_f64_add"(i64 %t550, i64 %t555)
  store i64 %t556, ptr %local.g2.192
  %t557 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.112)
  %t558 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.113)
  %t559 = call i64 @"sx_f64_mul"(i64 %t557, i64 %t558)
  %t560 = load i64, ptr %local.w3.183
  %t561 = call i64 @"sx_f64_mul"(i64 %t559, i64 %t560)
  %t562 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.114)
  %t563 = load i64, ptr %local.w3.183
  %t564 = call i64 @"sx_f64_mul"(i64 %t562, i64 %t563)
  %t565 = call i64 @"sx_f64_add"(i64 %t561, i64 %t564)
  %t566 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.115)
  %t567 = load i64, ptr %local.w3.183
  %t568 = call i64 @"sx_f64_mul"(i64 %t566, i64 %t567)
  %t569 = call i64 @"sx_f64_add"(i64 %t565, i64 %t568)
  store i64 %t569, ptr %local.g3.193
  %t570 = load i64, ptr %local.w0.180
  %t571 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.116)
  %t572 = load i64, ptr %local.g0.190
  %t573 = call i64 @"sx_f64_mul"(i64 %t571, i64 %t572)
  %t574 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.117)
  %t575 = call i64 @"sx_f64_div"(i64 %t573, i64 %t574)
  %t576 = call i64 @"sx_f64_sub"(i64 %t570, i64 %t575)
  store i64 %t576, ptr %local.w0.180
  %t577 = load i64, ptr %local.w1.181
  %t578 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.118)
  %t579 = load i64, ptr %local.g1.191
  %t580 = call i64 @"sx_f64_mul"(i64 %t578, i64 %t579)
  %t581 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.119)
  %t582 = call i64 @"sx_f64_div"(i64 %t580, i64 %t581)
  %t583 = call i64 @"sx_f64_sub"(i64 %t577, i64 %t582)
  store i64 %t583, ptr %local.w1.181
  %t584 = load i64, ptr %local.w2.182
  %t585 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.120)
  %t586 = load i64, ptr %local.g2.192
  %t587 = call i64 @"sx_f64_mul"(i64 %t585, i64 %t586)
  %t588 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.121)
  %t589 = call i64 @"sx_f64_div"(i64 %t587, i64 %t588)
  %t590 = call i64 @"sx_f64_sub"(i64 %t584, i64 %t589)
  store i64 %t590, ptr %local.w2.182
  %t591 = load i64, ptr %local.w3.183
  %t592 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.122)
  %t593 = load i64, ptr %local.g3.193
  %t594 = call i64 @"sx_f64_mul"(i64 %t592, i64 %t593)
  %t595 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.123)
  %t596 = call i64 @"sx_f64_div"(i64 %t594, i64 %t595)
  %t597 = call i64 @"sx_f64_sub"(i64 %t591, i64 %t596)
  store i64 %t597, ptr %local.w3.183
  %t598 = load i64, ptr %local.step.184
  %t599 = icmp eq i64 %t598, 299
  %t600 = zext i1 %t599 to i64
  %t601 = icmp ne i64 %t600, 0
  br i1 %t601, label %then14, label %else14
then14:
  %t602 = load i64, ptr %local.w0.180
  %t603 = load i64, ptr %local.w1.181
  %t604 = load i64, ptr %local.w2.182
  %t605 = load i64, ptr %local.w3.183
  %t606 = call i64 @"iratio_3task"(i64 %t602, i64 %t603, i64 %t604, i64 %t605)
  store i64 %t606, ptr %local.ir.194
  %t607 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.124)
  %t608 = ptrtoint ptr %t607 to i64
  %t609 = inttoptr i64 %t608 to ptr
  call void @intrinsic_print(ptr %t609)
  %t610 = load i64, ptr %local.w0.180
  %t611 = call i64 @"print_f64"(i64 %t610)
  %t612 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.125)
  %t613 = ptrtoint ptr %t612 to i64
  %t614 = inttoptr i64 %t613 to ptr
  call void @intrinsic_print(ptr %t614)
  %t615 = load i64, ptr %local.w1.181
  %t616 = call i64 @"print_f64"(i64 %t615)
  %t617 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.126)
  %t618 = ptrtoint ptr %t617 to i64
  %t619 = inttoptr i64 %t618 to ptr
  call void @intrinsic_print(ptr %t619)
  %t620 = load i64, ptr %local.w2.182
  %t621 = call i64 @"print_f64"(i64 %t620)
  %t622 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.127)
  %t623 = ptrtoint ptr %t622 to i64
  %t624 = inttoptr i64 %t623 to ptr
  call void @intrinsic_print(ptr %t624)
  %t625 = load i64, ptr %local.ir.194
  %t626 = call i64 @"print_f64"(i64 %t625)
  %t627 = load i64, ptr %local.ir.194
  %t628 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.128)
  %t629 = call i64 @"sx_f64_add"(i64 %t627, i64 %t628)
  %t630 = call i64 @"abs_f64"(i64 %t629)
  %t631 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.129)
  %t632 = call i64 @"sx_f64_lt"(i64 %t630, i64 %t631)
  %t633 = icmp ne i64 %t632, 0
  br i1 %t633, label %then15, label %else15
then15:
  %t634 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.130)
  %t635 = ptrtoint ptr %t634 to i64
  %t636 = inttoptr i64 %t635 to ptr
  call void @intrinsic_println(ptr %t636)
  br label %then15_end
then15_end:
  br label %endif15
else15:
  %t637 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.131)
  %t638 = ptrtoint ptr %t637 to i64
  %t639 = inttoptr i64 %t638 to ptr
  call void @intrinsic_println(ptr %t639)
  br label %else15_end
else15_end:
  br label %endif15
endif15:
  %t640 = phi i64 [ 0, %then15_end ], [ 0, %else15_end ]
  br label %then14_end
then14_end:
  br label %endif14
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t641 = phi i64 [ %t640, %then14_end ], [ 0, %else14_end ]
  %t642 = load i64, ptr %local.step.184
  %t643 = add i64 %t642, 1
  store i64 %t643, ptr %local.step.184
  br label %loop13
endloop13:
  %t644 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.132)
  %t645 = ptrtoint ptr %t644 to i64
  %t646 = inttoptr i64 %t645 to ptr
  call void @intrinsic_println(ptr %t646)
  %t647 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.133)
  %t648 = ptrtoint ptr %t647 to i64
  %t649 = inttoptr i64 %t648 to ptr
  call void @intrinsic_println(ptr %t649)
  %t650 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.134)
  %t651 = ptrtoint ptr %t650 to i64
  %t652 = inttoptr i64 %t651 to ptr
  call void @intrinsic_println(ptr %t652)
  %t653 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.135)
  %t654 = ptrtoint ptr %t653 to i64
  %t655 = inttoptr i64 %t654 to ptr
  call void @intrinsic_println(ptr %t655)
  %t656 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.136)
  %t657 = ptrtoint ptr %t656 to i64
  %t658 = inttoptr i64 %t657 to ptr
  call void @intrinsic_println(ptr %t658)
  ret i64 0
}

define i64 @"test_portfolio"() nounwind {
entry:
  %local.w1.659 = alloca i64
  %local.w2.660 = alloca i64
  %local.step.661 = alloca i64
  %local.w3.662 = alloca i64
  %local.pull_1.663 = alloca i64
  %local.pull_2.664 = alloca i64
  %local.pull_3.665 = alloca i64
  %local.g1_w1.666 = alloca i64
  %local.g1_w2.667 = alloca i64
  %local.g2_w1.668 = alloca i64
  %local.g2_w2.669 = alloca i64
  %local.g3_w1.670 = alloca i64
  %local.g3_w2.671 = alloca i64
  %local.d12.672 = alloca i64
  %local.d13.673 = alloca i64
  %local.d23.674 = alloca i64
  %local.cross.675 = alloca i64
  %local.n1.676 = alloca i64
  %local.n2.677 = alloca i64
  %local.n3.678 = alloca i64
  %local.ind.679 = alloca i64
  %local.ir.680 = alloca i64
  %local.total_g1.681 = alloca i64
  %local.total_g2.682 = alloca i64
  %t683 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.137)
  %t684 = ptrtoint ptr %t683 to i64
  %t685 = inttoptr i64 %t684 to ptr
  call void @intrinsic_println(ptr %t685)
  %t686 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.138)
  %t687 = ptrtoint ptr %t686 to i64
  %t688 = inttoptr i64 %t687 to ptr
  call void @intrinsic_println(ptr %t688)
  %t689 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.139)
  %t690 = ptrtoint ptr %t689 to i64
  %t691 = inttoptr i64 %t690 to ptr
  call void @intrinsic_println(ptr %t691)
  %t692 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.140)
  %t693 = ptrtoint ptr %t692 to i64
  %t694 = inttoptr i64 %t693 to ptr
  call void @intrinsic_println(ptr %t694)
  %t695 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.141)
  store i64 %t695, ptr %local.w1.659
  %t696 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.142)
  store i64 %t696, ptr %local.w2.660
  store i64 0, ptr %local.step.661
  %t697 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.143)
  %t698 = ptrtoint ptr %t697 to i64
  %t699 = inttoptr i64 %t698 to ptr
  call void @intrinsic_println(ptr %t699)
  br label %loop16
loop16:
  %t700 = load i64, ptr %local.step.661
  %t701 = icmp slt i64 %t700, 500
  %t702 = zext i1 %t701 to i64
  %t703 = icmp ne i64 %t702, 0
  br i1 %t703, label %body16, label %endloop16
body16:
  %t704 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.144)
  %t705 = load i64, ptr %local.w1.659
  %t706 = call i64 @"sx_f64_sub"(i64 %t704, i64 %t705)
  %t707 = load i64, ptr %local.w2.660
  %t708 = call i64 @"sx_f64_sub"(i64 %t706, i64 %t707)
  store i64 %t708, ptr %local.w3.662
  %t709 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.145)
  %t710 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.146)
  %t711 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.147)
  %t712 = call i64 @"sx_f64_mul"(i64 %t710, i64 %t711)
  %t713 = call i64 @"sx_f64_div"(i64 %t709, i64 %t712)
  store i64 %t713, ptr %local.pull_1.663
  %t714 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.148)
  %t715 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.149)
  %t716 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.150)
  %t717 = call i64 @"sx_f64_mul"(i64 %t715, i64 %t716)
  %t718 = call i64 @"sx_f64_div"(i64 %t714, i64 %t717)
  store i64 %t718, ptr %local.pull_2.664
  %t719 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.151)
  %t720 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.152)
  %t721 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.153)
  %t722 = call i64 @"sx_f64_mul"(i64 %t720, i64 %t721)
  %t723 = call i64 @"sx_f64_div"(i64 %t719, i64 %t722)
  store i64 %t723, ptr %local.pull_3.665
  %t724 = load i64, ptr %local.pull_1.663
  %t725 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.154)
  %t726 = load i64, ptr %local.w1.659
  %t727 = call i64 @"sx_f64_sub"(i64 %t725, i64 %t726)
  %t728 = call i64 @"sx_f64_mul"(i64 %t724, i64 %t727)
  store i64 %t728, ptr %local.g1_w1.666
  %t729 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.155)
  %t730 = load i64, ptr %local.pull_1.663
  %t731 = load i64, ptr %local.w2.660
  %t732 = call i64 @"sx_f64_mul"(i64 %t730, i64 %t731)
  %t733 = call i64 @"sx_f64_sub"(i64 %t729, i64 %t732)
  store i64 %t733, ptr %local.g1_w2.667
  %t734 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.156)
  %t735 = load i64, ptr %local.pull_2.664
  %t736 = load i64, ptr %local.w1.659
  %t737 = call i64 @"sx_f64_mul"(i64 %t735, i64 %t736)
  %t738 = call i64 @"sx_f64_sub"(i64 %t734, i64 %t737)
  store i64 %t738, ptr %local.g2_w1.668
  %t739 = load i64, ptr %local.pull_2.664
  %t740 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.157)
  %t741 = load i64, ptr %local.w2.660
  %t742 = call i64 @"sx_f64_sub"(i64 %t740, i64 %t741)
  %t743 = call i64 @"sx_f64_mul"(i64 %t739, i64 %t742)
  store i64 %t743, ptr %local.g2_w2.669
  %t744 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.158)
  %t745 = load i64, ptr %local.pull_3.665
  %t746 = load i64, ptr %local.w1.659
  %t747 = call i64 @"sx_f64_mul"(i64 %t745, i64 %t746)
  %t748 = call i64 @"sx_f64_sub"(i64 %t744, i64 %t747)
  store i64 %t748, ptr %local.g3_w1.670
  %t749 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.159)
  %t750 = load i64, ptr %local.pull_3.665
  %t751 = load i64, ptr %local.w2.660
  %t752 = call i64 @"sx_f64_mul"(i64 %t750, i64 %t751)
  %t753 = call i64 @"sx_f64_sub"(i64 %t749, i64 %t752)
  store i64 %t753, ptr %local.g3_w2.671
  %t754 = load i64, ptr %local.g1_w1.666
  %t755 = load i64, ptr %local.g2_w1.668
  %t756 = call i64 @"sx_f64_mul"(i64 %t754, i64 %t755)
  %t757 = load i64, ptr %local.g1_w2.667
  %t758 = load i64, ptr %local.g2_w2.669
  %t759 = call i64 @"sx_f64_mul"(i64 %t757, i64 %t758)
  %t760 = call i64 @"sx_f64_add"(i64 %t756, i64 %t759)
  store i64 %t760, ptr %local.d12.672
  %t761 = load i64, ptr %local.g1_w1.666
  %t762 = load i64, ptr %local.g3_w1.670
  %t763 = call i64 @"sx_f64_mul"(i64 %t761, i64 %t762)
  %t764 = load i64, ptr %local.g1_w2.667
  %t765 = load i64, ptr %local.g3_w2.671
  %t766 = call i64 @"sx_f64_mul"(i64 %t764, i64 %t765)
  %t767 = call i64 @"sx_f64_add"(i64 %t763, i64 %t766)
  store i64 %t767, ptr %local.d13.673
  %t768 = load i64, ptr %local.g2_w1.668
  %t769 = load i64, ptr %local.g3_w1.670
  %t770 = call i64 @"sx_f64_mul"(i64 %t768, i64 %t769)
  %t771 = load i64, ptr %local.g2_w2.669
  %t772 = load i64, ptr %local.g3_w2.671
  %t773 = call i64 @"sx_f64_mul"(i64 %t771, i64 %t772)
  %t774 = call i64 @"sx_f64_add"(i64 %t770, i64 %t773)
  store i64 %t774, ptr %local.d23.674
  %t775 = load i64, ptr %local.d12.672
  %t776 = load i64, ptr %local.d13.673
  %t777 = call i64 @"sx_f64_add"(i64 %t775, i64 %t776)
  %t778 = load i64, ptr %local.d23.674
  %t779 = call i64 @"sx_f64_add"(i64 %t777, i64 %t778)
  store i64 %t779, ptr %local.cross.675
  %t780 = load i64, ptr %local.g1_w1.666
  %t781 = load i64, ptr %local.g1_w1.666
  %t782 = call i64 @"sx_f64_mul"(i64 %t780, i64 %t781)
  %t783 = load i64, ptr %local.g1_w2.667
  %t784 = load i64, ptr %local.g1_w2.667
  %t785 = call i64 @"sx_f64_mul"(i64 %t783, i64 %t784)
  %t786 = call i64 @"sx_f64_add"(i64 %t782, i64 %t785)
  store i64 %t786, ptr %local.n1.676
  %t787 = load i64, ptr %local.g2_w1.668
  %t788 = load i64, ptr %local.g2_w1.668
  %t789 = call i64 @"sx_f64_mul"(i64 %t787, i64 %t788)
  %t790 = load i64, ptr %local.g2_w2.669
  %t791 = load i64, ptr %local.g2_w2.669
  %t792 = call i64 @"sx_f64_mul"(i64 %t790, i64 %t791)
  %t793 = call i64 @"sx_f64_add"(i64 %t789, i64 %t792)
  store i64 %t793, ptr %local.n2.677
  %t794 = load i64, ptr %local.g3_w1.670
  %t795 = load i64, ptr %local.g3_w1.670
  %t796 = call i64 @"sx_f64_mul"(i64 %t794, i64 %t795)
  %t797 = load i64, ptr %local.g3_w2.671
  %t798 = load i64, ptr %local.g3_w2.671
  %t799 = call i64 @"sx_f64_mul"(i64 %t797, i64 %t798)
  %t800 = call i64 @"sx_f64_add"(i64 %t796, i64 %t799)
  store i64 %t800, ptr %local.n3.678
  %t801 = load i64, ptr %local.n1.676
  %t802 = load i64, ptr %local.n2.677
  %t803 = call i64 @"sx_f64_add"(i64 %t801, i64 %t802)
  %t804 = load i64, ptr %local.n3.678
  %t805 = call i64 @"sx_f64_add"(i64 %t803, i64 %t804)
  store i64 %t805, ptr %local.ind.679
  %t806 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.160)
  store i64 %t806, ptr %local.ir.680
  %t807 = load i64, ptr %local.ind.679
  %t808 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.161)
  %t809 = call i64 @"sx_f64_gt"(i64 %t807, i64 %t808)
  %t810 = icmp ne i64 %t809, 0
  br i1 %t810, label %then17, label %else17
then17:
  %t811 = load i64, ptr %local.cross.675
  %t812 = load i64, ptr %local.ind.679
  %t813 = call i64 @"sx_f64_div"(i64 %t811, i64 %t812)
  store i64 %t813, ptr %local.ir.680
  br label %then17_end
then17_end:
  br label %endif17
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t814 = phi i64 [ 0, %then17_end ], [ 0, %else17_end ]
  %t815 = load i64, ptr %local.step.661
  %t816 = icmp eq i64 %t815, 0
  %t817 = zext i1 %t816 to i64
  %t818 = icmp ne i64 %t817, 0
  br i1 %t818, label %then18, label %else18
then18:
  %t819 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.162)
  %t820 = ptrtoint ptr %t819 to i64
  %t821 = inttoptr i64 %t820 to ptr
  call void @intrinsic_print(ptr %t821)
  %t822 = load i64, ptr %local.w1.659
  %t823 = call i64 @"print_f64"(i64 %t822)
  %t824 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.163)
  %t825 = ptrtoint ptr %t824 to i64
  %t826 = inttoptr i64 %t825 to ptr
  call void @intrinsic_print(ptr %t826)
  %t827 = load i64, ptr %local.w2.660
  %t828 = call i64 @"print_f64"(i64 %t827)
  %t829 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.164)
  %t830 = ptrtoint ptr %t829 to i64
  %t831 = inttoptr i64 %t830 to ptr
  call void @intrinsic_print(ptr %t831)
  %t832 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.165)
  %t833 = load i64, ptr %local.w1.659
  %t834 = call i64 @"sx_f64_sub"(i64 %t832, i64 %t833)
  %t835 = load i64, ptr %local.w2.660
  %t836 = call i64 @"sx_f64_sub"(i64 %t834, i64 %t835)
  %t837 = call i64 @"print_f64"(i64 %t836)
  %t838 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.166)
  %t839 = ptrtoint ptr %t838 to i64
  %t840 = inttoptr i64 %t839 to ptr
  call void @intrinsic_print(ptr %t840)
  %t841 = load i64, ptr %local.ir.680
  %t842 = call i64 @"print_f64"(i64 %t841)
  %t843 = load i64, ptr %local.ir.680
  %t844 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.167)
  %t845 = call i64 @"sx_f64_add"(i64 %t843, i64 %t844)
  %t846 = call i64 @"abs_f64"(i64 %t845)
  %t847 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.168)
  %t848 = call i64 @"sx_f64_lt"(i64 %t846, i64 %t847)
  %t849 = icmp ne i64 %t848, 0
  br i1 %t849, label %then19, label %else19
then19:
  %t850 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.169)
  %t851 = ptrtoint ptr %t850 to i64
  %t852 = inttoptr i64 %t851 to ptr
  call void @intrinsic_println(ptr %t852)
  br label %then19_end
then19_end:
  br label %endif19
else19:
  %t853 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.170)
  %t854 = ptrtoint ptr %t853 to i64
  %t855 = inttoptr i64 %t854 to ptr
  call void @intrinsic_println(ptr %t855)
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t856 = phi i64 [ 0, %then19_end ], [ 0, %else19_end ]
  br label %then18_end
then18_end:
  br label %endif18
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t857 = phi i64 [ %t856, %then18_end ], [ 0, %else18_end ]
  %t858 = load i64, ptr %local.step.661
  %t859 = icmp eq i64 %t858, 100
  %t860 = zext i1 %t859 to i64
  %t861 = icmp ne i64 %t860, 0
  br i1 %t861, label %then20, label %else20
then20:
  %t862 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.171)
  %t863 = ptrtoint ptr %t862 to i64
  %t864 = inttoptr i64 %t863 to ptr
  call void @intrinsic_print(ptr %t864)
  %t865 = load i64, ptr %local.w1.659
  %t866 = call i64 @"print_f64"(i64 %t865)
  %t867 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.172)
  %t868 = ptrtoint ptr %t867 to i64
  %t869 = inttoptr i64 %t868 to ptr
  call void @intrinsic_print(ptr %t869)
  %t870 = load i64, ptr %local.w2.660
  %t871 = call i64 @"print_f64"(i64 %t870)
  %t872 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.173)
  %t873 = ptrtoint ptr %t872 to i64
  %t874 = inttoptr i64 %t873 to ptr
  call void @intrinsic_print(ptr %t874)
  %t875 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.174)
  %t876 = load i64, ptr %local.w1.659
  %t877 = call i64 @"sx_f64_sub"(i64 %t875, i64 %t876)
  %t878 = load i64, ptr %local.w2.660
  %t879 = call i64 @"sx_f64_sub"(i64 %t877, i64 %t878)
  %t880 = call i64 @"print_f64"(i64 %t879)
  %t881 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.175)
  %t882 = ptrtoint ptr %t881 to i64
  %t883 = inttoptr i64 %t882 to ptr
  call void @intrinsic_print(ptr %t883)
  %t884 = load i64, ptr %local.ir.680
  %t885 = call i64 @"print_f64"(i64 %t884)
  %t886 = load i64, ptr %local.ir.680
  %t887 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.176)
  %t888 = call i64 @"sx_f64_add"(i64 %t886, i64 %t887)
  %t889 = call i64 @"abs_f64"(i64 %t888)
  %t890 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.177)
  %t891 = call i64 @"sx_f64_lt"(i64 %t889, i64 %t890)
  %t892 = icmp ne i64 %t891, 0
  br i1 %t892, label %then21, label %else21
then21:
  %t893 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.178)
  %t894 = ptrtoint ptr %t893 to i64
  %t895 = inttoptr i64 %t894 to ptr
  call void @intrinsic_println(ptr %t895)
  br label %then21_end
then21_end:
  br label %endif21
else21:
  %t896 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.179)
  %t897 = ptrtoint ptr %t896 to i64
  %t898 = inttoptr i64 %t897 to ptr
  call void @intrinsic_println(ptr %t898)
  br label %else21_end
else21_end:
  br label %endif21
endif21:
  %t899 = phi i64 [ 0, %then21_end ], [ 0, %else21_end ]
  br label %then20_end
then20_end:
  br label %endif20
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t900 = phi i64 [ %t899, %then20_end ], [ 0, %else20_end ]
  %t901 = load i64, ptr %local.step.661
  %t902 = icmp eq i64 %t901, 499
  %t903 = zext i1 %t902 to i64
  %t904 = icmp ne i64 %t903, 0
  br i1 %t904, label %then22, label %else22
then22:
  %t905 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.180)
  %t906 = ptrtoint ptr %t905 to i64
  %t907 = inttoptr i64 %t906 to ptr
  call void @intrinsic_print(ptr %t907)
  %t908 = load i64, ptr %local.w1.659
  %t909 = call i64 @"print_f64"(i64 %t908)
  %t910 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.181)
  %t911 = ptrtoint ptr %t910 to i64
  %t912 = inttoptr i64 %t911 to ptr
  call void @intrinsic_print(ptr %t912)
  %t913 = load i64, ptr %local.w2.660
  %t914 = call i64 @"print_f64"(i64 %t913)
  %t915 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.182)
  %t916 = ptrtoint ptr %t915 to i64
  %t917 = inttoptr i64 %t916 to ptr
  call void @intrinsic_print(ptr %t917)
  %t918 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.183)
  %t919 = load i64, ptr %local.w1.659
  %t920 = call i64 @"sx_f64_sub"(i64 %t918, i64 %t919)
  %t921 = load i64, ptr %local.w2.660
  %t922 = call i64 @"sx_f64_sub"(i64 %t920, i64 %t921)
  %t923 = call i64 @"print_f64"(i64 %t922)
  %t924 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.184)
  %t925 = ptrtoint ptr %t924 to i64
  %t926 = inttoptr i64 %t925 to ptr
  call void @intrinsic_print(ptr %t926)
  %t927 = load i64, ptr %local.ir.680
  %t928 = call i64 @"print_f64"(i64 %t927)
  %t929 = load i64, ptr %local.ir.680
  %t930 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.185)
  %t931 = call i64 @"sx_f64_add"(i64 %t929, i64 %t930)
  %t932 = call i64 @"abs_f64"(i64 %t931)
  %t933 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.186)
  %t934 = call i64 @"sx_f64_lt"(i64 %t932, i64 %t933)
  %t935 = icmp ne i64 %t934, 0
  br i1 %t935, label %then23, label %else23
then23:
  %t936 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.187)
  %t937 = ptrtoint ptr %t936 to i64
  %t938 = inttoptr i64 %t937 to ptr
  call void @intrinsic_println(ptr %t938)
  br label %then23_end
then23_end:
  br label %endif23
else23:
  %t939 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.188)
  %t940 = ptrtoint ptr %t939 to i64
  %t941 = inttoptr i64 %t940 to ptr
  call void @intrinsic_println(ptr %t941)
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t942 = phi i64 [ 0, %then23_end ], [ 0, %else23_end ]
  br label %then22_end
then22_end:
  br label %endif22
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t943 = phi i64 [ %t942, %then22_end ], [ 0, %else22_end ]
  %t944 = load i64, ptr %local.g1_w1.666
  %t945 = load i64, ptr %local.g2_w1.668
  %t946 = call i64 @"sx_f64_add"(i64 %t944, i64 %t945)
  %t947 = load i64, ptr %local.g3_w1.670
  %t948 = call i64 @"sx_f64_add"(i64 %t946, i64 %t947)
  store i64 %t948, ptr %local.total_g1.681
  %t949 = load i64, ptr %local.g1_w2.667
  %t950 = load i64, ptr %local.g2_w2.669
  %t951 = call i64 @"sx_f64_add"(i64 %t949, i64 %t950)
  %t952 = load i64, ptr %local.g3_w2.671
  %t953 = call i64 @"sx_f64_add"(i64 %t951, i64 %t952)
  store i64 %t953, ptr %local.total_g2.682
  %t954 = load i64, ptr %local.w1.659
  %t955 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.189)
  %t956 = load i64, ptr %local.total_g1.681
  %t957 = call i64 @"sx_f64_mul"(i64 %t955, i64 %t956)
  %t958 = call i64 @"sx_f64_add"(i64 %t954, i64 %t957)
  store i64 %t958, ptr %local.w1.659
  %t959 = load i64, ptr %local.w2.660
  %t960 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.190)
  %t961 = load i64, ptr %local.total_g2.682
  %t962 = call i64 @"sx_f64_mul"(i64 %t960, i64 %t961)
  %t963 = call i64 @"sx_f64_add"(i64 %t959, i64 %t962)
  store i64 %t963, ptr %local.w2.660
  %t964 = load i64, ptr %local.w1.659
  %t965 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.191)
  %t966 = call i64 @"sx_f64_lt"(i64 %t964, i64 %t965)
  %t967 = icmp ne i64 %t966, 0
  br i1 %t967, label %then24, label %else24
then24:
  %t968 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.192)
  store i64 %t968, ptr %local.w1.659
  br label %then24_end
then24_end:
  br label %endif24
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t969 = phi i64 [ 0, %then24_end ], [ 0, %else24_end ]
  %t970 = load i64, ptr %local.w2.660
  %t971 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.193)
  %t972 = call i64 @"sx_f64_lt"(i64 %t970, i64 %t971)
  %t973 = icmp ne i64 %t972, 0
  br i1 %t973, label %then25, label %else25
then25:
  %t974 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.194)
  store i64 %t974, ptr %local.w2.660
  br label %then25_end
then25_end:
  br label %endif25
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t975 = phi i64 [ 0, %then25_end ], [ 0, %else25_end ]
  %t976 = load i64, ptr %local.w1.659
  %t977 = load i64, ptr %local.w2.660
  %t978 = call i64 @"sx_f64_add"(i64 %t976, i64 %t977)
  %t979 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.195)
  %t980 = call i64 @"sx_f64_gt"(i64 %t978, i64 %t979)
  %t981 = icmp ne i64 %t980, 0
  br i1 %t981, label %then26, label %else26
then26:
  %t982 = load i64, ptr %local.w1.659
  %t983 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.196)
  %t984 = call i64 @"sx_f64_mul"(i64 %t982, i64 %t983)
  %t985 = load i64, ptr %local.w1.659
  %t986 = load i64, ptr %local.w2.660
  %t987 = call i64 @"sx_f64_add"(i64 %t985, i64 %t986)
  %t988 = call i64 @"sx_f64_div"(i64 %t984, i64 %t987)
  store i64 %t988, ptr %local.w1.659
  %t989 = load i64, ptr %local.w2.660
  %t990 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.197)
  %t991 = call i64 @"sx_f64_mul"(i64 %t989, i64 %t990)
  %t992 = load i64, ptr %local.w1.659
  %t993 = load i64, ptr %local.w2.660
  %t994 = call i64 @"sx_f64_add"(i64 %t992, i64 %t993)
  %t995 = call i64 @"sx_f64_div"(i64 %t991, i64 %t994)
  store i64 %t995, ptr %local.w2.660
  br label %then26_end
then26_end:
  br label %endif26
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t996 = phi i64 [ 0, %then26_end ], [ 0, %else26_end ]
  %t997 = load i64, ptr %local.step.661
  %t998 = add i64 %t997, 1
  store i64 %t998, ptr %local.step.661
  br label %loop16
endloop16:
  %t999 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.198)
  %t1000 = ptrtoint ptr %t999 to i64
  %t1001 = inttoptr i64 %t1000 to ptr
  call void @intrinsic_println(ptr %t1001)
  %t1002 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.199)
  %t1003 = ptrtoint ptr %t1002 to i64
  %t1004 = inttoptr i64 %t1003 to ptr
  call void @intrinsic_println(ptr %t1004)
  %t1005 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.200)
  %t1006 = ptrtoint ptr %t1005 to i64
  %t1007 = inttoptr i64 %t1006 to ptr
  call void @intrinsic_println(ptr %t1007)
  %t1008 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.201)
  %t1009 = ptrtoint ptr %t1008 to i64
  %t1010 = inttoptr i64 %t1009 to ptr
  call void @intrinsic_println(ptr %t1010)
  ret i64 0
}

define i64 @"test_ecosystem"() nounwind {
entry:
  %local.d0.1011 = alloca i64
  %local.d1.1012 = alloca i64
  %local.d2.1013 = alloca i64
  %local.gp_0.1014 = alloca i64
  %local.gp_1.1015 = alloca i64
  %local.gp_2.1016 = alloca i64
  %local.gr_0.1017 = alloca i64
  %local.gr_1.1018 = alloca i64
  %local.gr_2.1019 = alloca i64
  %local.gd_0.1020 = alloca i64
  %local.gd_1.1021 = alloca i64
  %local.gd_2.1022 = alloca i64
  %local.c_pr.1023 = alloca i64
  %local.c_pd.1024 = alloca i64
  %local.c_rd.1025 = alloca i64
  %local.cross.1026 = alloca i64
  %local.np.1027 = alloca i64
  %local.nr.1028 = alloca i64
  %local.nd.1029 = alloca i64
  %local.ind.1030 = alloca i64
  %local.ir.1031 = alloca i64
  %t1032 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.202)
  %t1033 = ptrtoint ptr %t1032 to i64
  %t1034 = inttoptr i64 %t1033 to ptr
  call void @intrinsic_println(ptr %t1034)
  %t1035 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.203)
  %t1036 = ptrtoint ptr %t1035 to i64
  %t1037 = inttoptr i64 %t1036 to ptr
  call void @intrinsic_println(ptr %t1037)
  %t1038 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.204)
  %t1039 = ptrtoint ptr %t1038 to i64
  %t1040 = inttoptr i64 %t1039 to ptr
  call void @intrinsic_println(ptr %t1040)
  %t1041 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.205)
  %t1042 = ptrtoint ptr %t1041 to i64
  %t1043 = inttoptr i64 %t1042 to ptr
  call void @intrinsic_println(ptr %t1043)
  %t1044 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.206)
  %t1045 = ptrtoint ptr %t1044 to i64
  %t1046 = inttoptr i64 %t1045 to ptr
  call void @intrinsic_println(ptr %t1046)
  %t1047 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.207)
  store i64 %t1047, ptr %local.d0.1011
  br label %loop27
loop27:
  %t1048 = load i64, ptr %local.d0.1011
  %t1049 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.208)
  %t1050 = call i64 @"sx_f64_le"(i64 %t1048, i64 %t1049)
  %t1051 = icmp ne i64 %t1050, 0
  br i1 %t1051, label %body27, label %endloop27
body27:
  %t1052 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.209)
  store i64 %t1052, ptr %local.d1.1012
  %t1053 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.210)
  store i64 %t1053, ptr %local.d2.1013
  %t1054 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.211)
  %t1055 = load i64, ptr %local.d0.1011
  %t1056 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.212)
  %t1057 = call i64 @"sx_f64_sub"(i64 %t1055, i64 %t1056)
  %t1058 = call i64 @"sx_f64_mul"(i64 %t1054, i64 %t1057)
  store i64 %t1058, ptr %local.gp_0.1014
  %t1059 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.213)
  %t1060 = load i64, ptr %local.d1.1012
  %t1061 = call i64 @"sx_f64_mul"(i64 %t1059, i64 %t1060)
  store i64 %t1061, ptr %local.gp_1.1015
  %t1062 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.214)
  %t1063 = load i64, ptr %local.d2.1013
  %t1064 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.215)
  %t1065 = call i64 @"sx_f64_sub"(i64 %t1063, i64 %t1064)
  %t1066 = call i64 @"sx_f64_mul"(i64 %t1062, i64 %t1065)
  store i64 %t1066, ptr %local.gp_2.1016
  %t1067 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.216)
  %t1068 = load i64, ptr %local.d0.1011
  %t1069 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.217)
  %t1070 = call i64 @"sx_f64_sub"(i64 %t1068, i64 %t1069)
  %t1071 = call i64 @"sx_f64_mul"(i64 %t1067, i64 %t1070)
  store i64 %t1071, ptr %local.gr_0.1017
  %t1072 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.218)
  %t1073 = load i64, ptr %local.d1.1012
  %t1074 = call i64 @"sx_f64_mul"(i64 %t1072, i64 %t1073)
  store i64 %t1074, ptr %local.gr_1.1018
  %t1075 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.219)
  %t1076 = load i64, ptr %local.d2.1013
  %t1077 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.220)
  %t1078 = call i64 @"sx_f64_sub"(i64 %t1076, i64 %t1077)
  %t1079 = call i64 @"sx_f64_mul"(i64 %t1075, i64 %t1078)
  store i64 %t1079, ptr %local.gr_2.1019
  %t1080 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.221)
  %t1081 = load i64, ptr %local.d0.1011
  %t1082 = call i64 @"sx_f64_mul"(i64 %t1080, i64 %t1081)
  store i64 %t1082, ptr %local.gd_0.1020
  %t1083 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.222)
  %t1084 = load i64, ptr %local.d1.1012
  %t1085 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.223)
  %t1086 = call i64 @"sx_f64_sub"(i64 %t1084, i64 %t1085)
  %t1087 = call i64 @"sx_f64_mul"(i64 %t1083, i64 %t1086)
  store i64 %t1087, ptr %local.gd_1.1021
  %t1088 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.224)
  %t1089 = load i64, ptr %local.d2.1013
  %t1090 = call i64 @"sx_f64_mul"(i64 %t1088, i64 %t1089)
  store i64 %t1090, ptr %local.gd_2.1022
  %t1091 = load i64, ptr %local.gp_0.1014
  %t1092 = load i64, ptr %local.gr_0.1017
  %t1093 = call i64 @"sx_f64_mul"(i64 %t1091, i64 %t1092)
  %t1094 = load i64, ptr %local.gp_1.1015
  %t1095 = load i64, ptr %local.gr_1.1018
  %t1096 = call i64 @"sx_f64_mul"(i64 %t1094, i64 %t1095)
  %t1097 = call i64 @"sx_f64_add"(i64 %t1093, i64 %t1096)
  %t1098 = load i64, ptr %local.gp_2.1016
  %t1099 = load i64, ptr %local.gr_2.1019
  %t1100 = call i64 @"sx_f64_mul"(i64 %t1098, i64 %t1099)
  %t1101 = call i64 @"sx_f64_add"(i64 %t1097, i64 %t1100)
  store i64 %t1101, ptr %local.c_pr.1023
  %t1102 = load i64, ptr %local.gp_0.1014
  %t1103 = load i64, ptr %local.gd_0.1020
  %t1104 = call i64 @"sx_f64_mul"(i64 %t1102, i64 %t1103)
  %t1105 = load i64, ptr %local.gp_1.1015
  %t1106 = load i64, ptr %local.gd_1.1021
  %t1107 = call i64 @"sx_f64_mul"(i64 %t1105, i64 %t1106)
  %t1108 = call i64 @"sx_f64_add"(i64 %t1104, i64 %t1107)
  %t1109 = load i64, ptr %local.gp_2.1016
  %t1110 = load i64, ptr %local.gd_2.1022
  %t1111 = call i64 @"sx_f64_mul"(i64 %t1109, i64 %t1110)
  %t1112 = call i64 @"sx_f64_add"(i64 %t1108, i64 %t1111)
  store i64 %t1112, ptr %local.c_pd.1024
  %t1113 = load i64, ptr %local.gr_0.1017
  %t1114 = load i64, ptr %local.gd_0.1020
  %t1115 = call i64 @"sx_f64_mul"(i64 %t1113, i64 %t1114)
  %t1116 = load i64, ptr %local.gr_1.1018
  %t1117 = load i64, ptr %local.gd_1.1021
  %t1118 = call i64 @"sx_f64_mul"(i64 %t1116, i64 %t1117)
  %t1119 = call i64 @"sx_f64_add"(i64 %t1115, i64 %t1118)
  %t1120 = load i64, ptr %local.gr_2.1019
  %t1121 = load i64, ptr %local.gd_2.1022
  %t1122 = call i64 @"sx_f64_mul"(i64 %t1120, i64 %t1121)
  %t1123 = call i64 @"sx_f64_add"(i64 %t1119, i64 %t1122)
  store i64 %t1123, ptr %local.c_rd.1025
  %t1124 = load i64, ptr %local.c_pr.1023
  %t1125 = load i64, ptr %local.c_pd.1024
  %t1126 = call i64 @"sx_f64_add"(i64 %t1124, i64 %t1125)
  %t1127 = load i64, ptr %local.c_rd.1025
  %t1128 = call i64 @"sx_f64_add"(i64 %t1126, i64 %t1127)
  store i64 %t1128, ptr %local.cross.1026
  %t1129 = load i64, ptr %local.gp_0.1014
  %t1130 = load i64, ptr %local.gp_0.1014
  %t1131 = call i64 @"sx_f64_mul"(i64 %t1129, i64 %t1130)
  %t1132 = load i64, ptr %local.gp_1.1015
  %t1133 = load i64, ptr %local.gp_1.1015
  %t1134 = call i64 @"sx_f64_mul"(i64 %t1132, i64 %t1133)
  %t1135 = call i64 @"sx_f64_add"(i64 %t1131, i64 %t1134)
  %t1136 = load i64, ptr %local.gp_2.1016
  %t1137 = load i64, ptr %local.gp_2.1016
  %t1138 = call i64 @"sx_f64_mul"(i64 %t1136, i64 %t1137)
  %t1139 = call i64 @"sx_f64_add"(i64 %t1135, i64 %t1138)
  store i64 %t1139, ptr %local.np.1027
  %t1140 = load i64, ptr %local.gr_0.1017
  %t1141 = load i64, ptr %local.gr_0.1017
  %t1142 = call i64 @"sx_f64_mul"(i64 %t1140, i64 %t1141)
  %t1143 = load i64, ptr %local.gr_1.1018
  %t1144 = load i64, ptr %local.gr_1.1018
  %t1145 = call i64 @"sx_f64_mul"(i64 %t1143, i64 %t1144)
  %t1146 = call i64 @"sx_f64_add"(i64 %t1142, i64 %t1145)
  %t1147 = load i64, ptr %local.gr_2.1019
  %t1148 = load i64, ptr %local.gr_2.1019
  %t1149 = call i64 @"sx_f64_mul"(i64 %t1147, i64 %t1148)
  %t1150 = call i64 @"sx_f64_add"(i64 %t1146, i64 %t1149)
  store i64 %t1150, ptr %local.nr.1028
  %t1151 = load i64, ptr %local.gd_0.1020
  %t1152 = load i64, ptr %local.gd_0.1020
  %t1153 = call i64 @"sx_f64_mul"(i64 %t1151, i64 %t1152)
  %t1154 = load i64, ptr %local.gd_1.1021
  %t1155 = load i64, ptr %local.gd_1.1021
  %t1156 = call i64 @"sx_f64_mul"(i64 %t1154, i64 %t1155)
  %t1157 = call i64 @"sx_f64_add"(i64 %t1153, i64 %t1156)
  %t1158 = load i64, ptr %local.gd_2.1022
  %t1159 = load i64, ptr %local.gd_2.1022
  %t1160 = call i64 @"sx_f64_mul"(i64 %t1158, i64 %t1159)
  %t1161 = call i64 @"sx_f64_add"(i64 %t1157, i64 %t1160)
  store i64 %t1161, ptr %local.nd.1029
  %t1162 = load i64, ptr %local.np.1027
  %t1163 = load i64, ptr %local.nr.1028
  %t1164 = call i64 @"sx_f64_add"(i64 %t1162, i64 %t1163)
  %t1165 = load i64, ptr %local.nd.1029
  %t1166 = call i64 @"sx_f64_add"(i64 %t1164, i64 %t1165)
  store i64 %t1166, ptr %local.ind.1030
  %t1167 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.225)
  store i64 %t1167, ptr %local.ir.1031
  %t1168 = load i64, ptr %local.ind.1030
  %t1169 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.226)
  %t1170 = call i64 @"sx_f64_gt"(i64 %t1168, i64 %t1169)
  %t1171 = icmp ne i64 %t1170, 0
  br i1 %t1171, label %then28, label %else28
then28:
  %t1172 = load i64, ptr %local.cross.1026
  %t1173 = load i64, ptr %local.ind.1030
  %t1174 = call i64 @"sx_f64_div"(i64 %t1172, i64 %t1173)
  store i64 %t1174, ptr %local.ir.1031
  br label %then28_end
then28_end:
  br label %endif28
else28:
  br label %else28_end
else28_end:
  br label %endif28
endif28:
  %t1175 = phi i64 [ 0, %then28_end ], [ 0, %else28_end ]
  %t1176 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.227)
  %t1177 = ptrtoint ptr %t1176 to i64
  %t1178 = inttoptr i64 %t1177 to ptr
  call void @intrinsic_print(ptr %t1178)
  %t1179 = load i64, ptr %local.d0.1011
  %t1180 = call i64 @"print_f64"(i64 %t1179)
  %t1181 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.228)
  %t1182 = ptrtoint ptr %t1181 to i64
  %t1183 = inttoptr i64 %t1182 to ptr
  call void @intrinsic_print(ptr %t1183)
  %t1184 = load i64, ptr %local.ir.1031
  %t1185 = call i64 @"print_f64"(i64 %t1184)
  %t1186 = load i64, ptr %local.ir.1031
  %t1187 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.229)
  %t1188 = call i64 @"sx_f64_add"(i64 %t1186, i64 %t1187)
  %t1189 = call i64 @"abs_f64"(i64 %t1188)
  %t1190 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.230)
  %t1191 = call i64 @"sx_f64_lt"(i64 %t1189, i64 %t1190)
  %t1192 = icmp ne i64 %t1191, 0
  br i1 %t1192, label %then29, label %else29
then29:
  %t1193 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.231)
  %t1194 = ptrtoint ptr %t1193 to i64
  %t1195 = inttoptr i64 %t1194 to ptr
  call void @intrinsic_println(ptr %t1195)
  br label %then29_end
then29_end:
  br label %endif29
else29:
  %t1196 = load i64, ptr %local.ir.1031
  %t1197 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.232)
  %t1198 = xor i64 %t1197, -9223372036854775808
  %t1199 = call i64 @"sx_f64_gt"(i64 %t1196, i64 %t1198)
  %t1200 = icmp ne i64 %t1199, 0
  br i1 %t1200, label %then30, label %else30
then30:
  %t1201 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.233)
  %t1202 = ptrtoint ptr %t1201 to i64
  %t1203 = inttoptr i64 %t1202 to ptr
  call void @intrinsic_println(ptr %t1203)
  br label %then30_end
then30_end:
  br label %endif30
else30:
  %t1204 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.234)
  %t1205 = ptrtoint ptr %t1204 to i64
  %t1206 = inttoptr i64 %t1205 to ptr
  call void @intrinsic_println(ptr %t1206)
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1207 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  br label %else29_end
else29_end:
  br label %endif29
endif29:
  %t1208 = phi i64 [ 0, %then29_end ], [ %t1207, %else29_end ]
  %t1209 = load i64, ptr %local.d0.1011
  %t1210 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.235)
  %t1211 = call i64 @"sx_f64_add"(i64 %t1209, i64 %t1210)
  store i64 %t1211, ptr %local.d0.1011
  br label %loop27
endloop27:
  %t1212 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.236)
  %t1213 = ptrtoint ptr %t1212 to i64
  %t1214 = inttoptr i64 %t1213 to ptr
  call void @intrinsic_println(ptr %t1214)
  %t1215 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.237)
  %t1216 = ptrtoint ptr %t1215 to i64
  %t1217 = inttoptr i64 %t1216 to ptr
  call void @intrinsic_println(ptr %t1217)
  %t1218 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.238)
  %t1219 = ptrtoint ptr %t1218 to i64
  %t1220 = inttoptr i64 %t1219 to ptr
  call void @intrinsic_println(ptr %t1220)
  %t1221 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.239)
  %t1222 = ptrtoint ptr %t1221 to i64
  %t1223 = inttoptr i64 %t1222 to ptr
  call void @intrinsic_println(ptr %t1223)
  %t1224 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.240)
  %t1225 = ptrtoint ptr %t1224 to i64
  %t1226 = inttoptr i64 %t1225 to ptr
  call void @intrinsic_println(ptr %t1226)
  ret i64 0
}

define i64 @"test_gradient_health"() nounwind {
entry:
  %local.h1.1227 = alloca i64
  %local.h2.1228 = alloca i64
  %local.h3.1229 = alloca i64
  %local.hc12.1230 = alloca i64
  %local.hc13.1231 = alloca i64
  %local.hc23.1232 = alloca i64
  %local.hcross.1233 = alloca i64
  %local.hind.1234 = alloca i64
  %local.h_ir.1235 = alloca i64
  %local.v1.1236 = alloca i64
  %local.v2.1237 = alloca i64
  %local.v3.1238 = alloca i64
  %local.vcross.1239 = alloca i64
  %local.vind.1240 = alloca i64
  %local.v_ir.1241 = alloca i64
  %local.e1.1242 = alloca i64
  %local.e2.1243 = alloca i64
  %local.e3.1244 = alloca i64
  %local.ecross.1245 = alloca i64
  %local.eind.1246 = alloca i64
  %local.e_ir.1247 = alloca i64
  %local.b1.1248 = alloca i64
  %local.b2.1249 = alloca i64
  %local.b3.1250 = alloca i64
  %local.bcross.1251 = alloca i64
  %local.bind.1252 = alloca i64
  %local.b_ir.1253 = alloca i64
  %t1254 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.241)
  %t1255 = ptrtoint ptr %t1254 to i64
  %t1256 = inttoptr i64 %t1255 to ptr
  call void @intrinsic_println(ptr %t1256)
  %t1257 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.242)
  %t1258 = ptrtoint ptr %t1257 to i64
  %t1259 = inttoptr i64 %t1258 to ptr
  call void @intrinsic_println(ptr %t1259)
  %t1260 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.243)
  %t1261 = ptrtoint ptr %t1260 to i64
  %t1262 = inttoptr i64 %t1261 to ptr
  call void @intrinsic_println(ptr %t1262)
  %t1263 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.244)
  %t1264 = ptrtoint ptr %t1263 to i64
  %t1265 = inttoptr i64 %t1264 to ptr
  call void @intrinsic_println(ptr %t1265)
  %t1266 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.245)
  %t1267 = ptrtoint ptr %t1266 to i64
  %t1268 = inttoptr i64 %t1267 to ptr
  call void @intrinsic_println(ptr %t1268)
  %t1269 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.246)
  store i64 %t1269, ptr %local.h1.1227
  %t1270 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.247)
  %t1271 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.248)
  %t1272 = call i64 @"sx_f64_sub"(i64 %t1270, i64 %t1271)
  store i64 %t1272, ptr %local.h2.1228
  %t1273 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.249)
  store i64 %t1273, ptr %local.h3.1229
  %t1274 = load i64, ptr %local.h1.1227
  %t1275 = load i64, ptr %local.h2.1228
  %t1276 = call i64 @"sx_f64_mul"(i64 %t1274, i64 %t1275)
  store i64 %t1276, ptr %local.hc12.1230
  %t1277 = load i64, ptr %local.h1.1227
  %t1278 = load i64, ptr %local.h3.1229
  %t1279 = call i64 @"sx_f64_mul"(i64 %t1277, i64 %t1278)
  store i64 %t1279, ptr %local.hc13.1231
  %t1280 = load i64, ptr %local.h2.1228
  %t1281 = load i64, ptr %local.h3.1229
  %t1282 = call i64 @"sx_f64_mul"(i64 %t1280, i64 %t1281)
  store i64 %t1282, ptr %local.hc23.1232
  %t1283 = load i64, ptr %local.hc12.1230
  %t1284 = load i64, ptr %local.hc13.1231
  %t1285 = call i64 @"sx_f64_add"(i64 %t1283, i64 %t1284)
  %t1286 = load i64, ptr %local.hc23.1232
  %t1287 = call i64 @"sx_f64_add"(i64 %t1285, i64 %t1286)
  store i64 %t1287, ptr %local.hcross.1233
  %t1288 = load i64, ptr %local.h1.1227
  %t1289 = load i64, ptr %local.h1.1227
  %t1290 = call i64 @"sx_f64_mul"(i64 %t1288, i64 %t1289)
  %t1291 = load i64, ptr %local.h2.1228
  %t1292 = load i64, ptr %local.h2.1228
  %t1293 = call i64 @"sx_f64_mul"(i64 %t1291, i64 %t1292)
  %t1294 = call i64 @"sx_f64_add"(i64 %t1290, i64 %t1293)
  %t1295 = load i64, ptr %local.h3.1229
  %t1296 = load i64, ptr %local.h3.1229
  %t1297 = call i64 @"sx_f64_mul"(i64 %t1295, i64 %t1296)
  %t1298 = call i64 @"sx_f64_add"(i64 %t1294, i64 %t1297)
  store i64 %t1298, ptr %local.hind.1234
  %t1299 = load i64, ptr %local.hcross.1233
  %t1300 = load i64, ptr %local.hind.1234
  %t1301 = call i64 @"sx_f64_div"(i64 %t1299, i64 %t1300)
  store i64 %t1301, ptr %local.h_ir.1235
  %t1302 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.250)
  %t1303 = ptrtoint ptr %t1302 to i64
  %t1304 = inttoptr i64 %t1303 to ptr
  call void @intrinsic_print(ptr %t1304)
  %t1305 = load i64, ptr %local.h_ir.1235
  %t1306 = call i64 @"print_f64"(i64 %t1305)
  %t1307 = load i64, ptr %local.h_ir.1235
  %t1308 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.251)
  %t1309 = call i64 @"sx_f64_add"(i64 %t1307, i64 %t1308)
  %t1310 = call i64 @"abs_f64"(i64 %t1309)
  %t1311 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.252)
  %t1312 = call i64 @"sx_f64_lt"(i64 %t1310, i64 %t1311)
  %t1313 = icmp ne i64 %t1312, 0
  br i1 %t1313, label %then31, label %else31
then31:
  %t1314 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.253)
  %t1315 = ptrtoint ptr %t1314 to i64
  %t1316 = inttoptr i64 %t1315 to ptr
  call void @intrinsic_println(ptr %t1316)
  br label %then31_end
then31_end:
  br label %endif31
else31:
  %t1317 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.254)
  %t1318 = ptrtoint ptr %t1317 to i64
  %t1319 = inttoptr i64 %t1318 to ptr
  call void @intrinsic_println(ptr %t1319)
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1320 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t1321 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.255)
  store i64 %t1321, ptr %local.v1.1236
  %t1322 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.256)
  store i64 %t1322, ptr %local.v2.1237
  %t1323 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.257)
  store i64 %t1323, ptr %local.v3.1238
  %t1324 = load i64, ptr %local.v1.1236
  %t1325 = load i64, ptr %local.v2.1237
  %t1326 = call i64 @"sx_f64_mul"(i64 %t1324, i64 %t1325)
  %t1327 = load i64, ptr %local.v1.1236
  %t1328 = load i64, ptr %local.v3.1238
  %t1329 = call i64 @"sx_f64_mul"(i64 %t1327, i64 %t1328)
  %t1330 = call i64 @"sx_f64_add"(i64 %t1326, i64 %t1329)
  %t1331 = load i64, ptr %local.v2.1237
  %t1332 = load i64, ptr %local.v3.1238
  %t1333 = call i64 @"sx_f64_mul"(i64 %t1331, i64 %t1332)
  %t1334 = call i64 @"sx_f64_add"(i64 %t1330, i64 %t1333)
  store i64 %t1334, ptr %local.vcross.1239
  %t1335 = load i64, ptr %local.v1.1236
  %t1336 = load i64, ptr %local.v1.1236
  %t1337 = call i64 @"sx_f64_mul"(i64 %t1335, i64 %t1336)
  %t1338 = load i64, ptr %local.v2.1237
  %t1339 = load i64, ptr %local.v2.1237
  %t1340 = call i64 @"sx_f64_mul"(i64 %t1338, i64 %t1339)
  %t1341 = call i64 @"sx_f64_add"(i64 %t1337, i64 %t1340)
  %t1342 = load i64, ptr %local.v3.1238
  %t1343 = load i64, ptr %local.v3.1238
  %t1344 = call i64 @"sx_f64_mul"(i64 %t1342, i64 %t1343)
  %t1345 = call i64 @"sx_f64_add"(i64 %t1341, i64 %t1344)
  store i64 %t1345, ptr %local.vind.1240
  %t1346 = load i64, ptr %local.vcross.1239
  %t1347 = load i64, ptr %local.vind.1240
  %t1348 = call i64 @"sx_f64_div"(i64 %t1346, i64 %t1347)
  store i64 %t1348, ptr %local.v_ir.1241
  %t1349 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.258)
  %t1350 = ptrtoint ptr %t1349 to i64
  %t1351 = inttoptr i64 %t1350 to ptr
  call void @intrinsic_print(ptr %t1351)
  %t1352 = load i64, ptr %local.v_ir.1241
  %t1353 = call i64 @"print_f64"(i64 %t1352)
  %t1354 = load i64, ptr %local.v_ir.1241
  %t1355 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.259)
  %t1356 = call i64 @"sx_f64_add"(i64 %t1354, i64 %t1355)
  %t1357 = call i64 @"abs_f64"(i64 %t1356)
  %t1358 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.260)
  %t1359 = call i64 @"sx_f64_lt"(i64 %t1357, i64 %t1358)
  %t1360 = icmp ne i64 %t1359, 0
  br i1 %t1360, label %then32, label %else32
then32:
  %t1361 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.261)
  %t1362 = ptrtoint ptr %t1361 to i64
  %t1363 = inttoptr i64 %t1362 to ptr
  call void @intrinsic_println(ptr %t1363)
  br label %then32_end
then32_end:
  br label %endif32
else32:
  %t1364 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.262)
  %t1365 = ptrtoint ptr %t1364 to i64
  %t1366 = inttoptr i64 %t1365 to ptr
  call void @intrinsic_println(ptr %t1366)
  br label %else32_end
else32_end:
  br label %endif32
endif32:
  %t1367 = phi i64 [ 0, %then32_end ], [ 0, %else32_end ]
  %t1368 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.263)
  store i64 %t1368, ptr %local.e1.1242
  %t1369 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.264)
  store i64 %t1369, ptr %local.e2.1243
  %t1370 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.265)
  store i64 %t1370, ptr %local.e3.1244
  %t1371 = load i64, ptr %local.e1.1242
  %t1372 = load i64, ptr %local.e2.1243
  %t1373 = call i64 @"sx_f64_mul"(i64 %t1371, i64 %t1372)
  %t1374 = load i64, ptr %local.e1.1242
  %t1375 = load i64, ptr %local.e3.1244
  %t1376 = call i64 @"sx_f64_mul"(i64 %t1374, i64 %t1375)
  %t1377 = call i64 @"sx_f64_add"(i64 %t1373, i64 %t1376)
  %t1378 = load i64, ptr %local.e2.1243
  %t1379 = load i64, ptr %local.e3.1244
  %t1380 = call i64 @"sx_f64_mul"(i64 %t1378, i64 %t1379)
  %t1381 = call i64 @"sx_f64_add"(i64 %t1377, i64 %t1380)
  store i64 %t1381, ptr %local.ecross.1245
  %t1382 = load i64, ptr %local.e1.1242
  %t1383 = load i64, ptr %local.e1.1242
  %t1384 = call i64 @"sx_f64_mul"(i64 %t1382, i64 %t1383)
  %t1385 = load i64, ptr %local.e2.1243
  %t1386 = load i64, ptr %local.e2.1243
  %t1387 = call i64 @"sx_f64_mul"(i64 %t1385, i64 %t1386)
  %t1388 = call i64 @"sx_f64_add"(i64 %t1384, i64 %t1387)
  %t1389 = load i64, ptr %local.e3.1244
  %t1390 = load i64, ptr %local.e3.1244
  %t1391 = call i64 @"sx_f64_mul"(i64 %t1389, i64 %t1390)
  %t1392 = call i64 @"sx_f64_add"(i64 %t1388, i64 %t1391)
  store i64 %t1392, ptr %local.eind.1246
  %t1393 = load i64, ptr %local.ecross.1245
  %t1394 = load i64, ptr %local.eind.1246
  %t1395 = call i64 @"sx_f64_div"(i64 %t1393, i64 %t1394)
  store i64 %t1395, ptr %local.e_ir.1247
  %t1396 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.266)
  %t1397 = ptrtoint ptr %t1396 to i64
  %t1398 = inttoptr i64 %t1397 to ptr
  call void @intrinsic_print(ptr %t1398)
  %t1399 = load i64, ptr %local.e_ir.1247
  %t1400 = call i64 @"print_f64"(i64 %t1399)
  %t1401 = load i64, ptr %local.e_ir.1247
  %t1402 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.267)
  %t1403 = call i64 @"sx_f64_add"(i64 %t1401, i64 %t1402)
  %t1404 = call i64 @"abs_f64"(i64 %t1403)
  %t1405 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.268)
  %t1406 = call i64 @"sx_f64_lt"(i64 %t1404, i64 %t1405)
  %t1407 = icmp ne i64 %t1406, 0
  br i1 %t1407, label %then33, label %else33
then33:
  %t1408 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.269)
  %t1409 = ptrtoint ptr %t1408 to i64
  %t1410 = inttoptr i64 %t1409 to ptr
  call void @intrinsic_println(ptr %t1410)
  br label %then33_end
then33_end:
  br label %endif33
else33:
  %t1411 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.270)
  %t1412 = ptrtoint ptr %t1411 to i64
  %t1413 = inttoptr i64 %t1412 to ptr
  call void @intrinsic_println(ptr %t1413)
  br label %else33_end
else33_end:
  br label %endif33
endif33:
  %t1414 = phi i64 [ 0, %then33_end ], [ 0, %else33_end ]
  %t1415 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.271)
  store i64 %t1415, ptr %local.b1.1248
  %t1416 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.272)
  %t1417 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.273)
  %t1418 = call i64 @"sx_f64_sub"(i64 %t1416, i64 %t1417)
  store i64 %t1418, ptr %local.b2.1249
  %t1419 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.274)
  store i64 %t1419, ptr %local.b3.1250
  %t1420 = load i64, ptr %local.b1.1248
  %t1421 = load i64, ptr %local.b2.1249
  %t1422 = call i64 @"sx_f64_mul"(i64 %t1420, i64 %t1421)
  %t1423 = load i64, ptr %local.b1.1248
  %t1424 = load i64, ptr %local.b3.1250
  %t1425 = call i64 @"sx_f64_mul"(i64 %t1423, i64 %t1424)
  %t1426 = call i64 @"sx_f64_add"(i64 %t1422, i64 %t1425)
  %t1427 = load i64, ptr %local.b2.1249
  %t1428 = load i64, ptr %local.b3.1250
  %t1429 = call i64 @"sx_f64_mul"(i64 %t1427, i64 %t1428)
  %t1430 = call i64 @"sx_f64_add"(i64 %t1426, i64 %t1429)
  store i64 %t1430, ptr %local.bcross.1251
  %t1431 = load i64, ptr %local.b1.1248
  %t1432 = load i64, ptr %local.b1.1248
  %t1433 = call i64 @"sx_f64_mul"(i64 %t1431, i64 %t1432)
  %t1434 = load i64, ptr %local.b2.1249
  %t1435 = load i64, ptr %local.b2.1249
  %t1436 = call i64 @"sx_f64_mul"(i64 %t1434, i64 %t1435)
  %t1437 = call i64 @"sx_f64_add"(i64 %t1433, i64 %t1436)
  %t1438 = load i64, ptr %local.b3.1250
  %t1439 = load i64, ptr %local.b3.1250
  %t1440 = call i64 @"sx_f64_mul"(i64 %t1438, i64 %t1439)
  %t1441 = call i64 @"sx_f64_add"(i64 %t1437, i64 %t1440)
  store i64 %t1441, ptr %local.bind.1252
  %t1442 = load i64, ptr %local.bcross.1251
  %t1443 = load i64, ptr %local.bind.1252
  %t1444 = call i64 @"sx_f64_div"(i64 %t1442, i64 %t1443)
  store i64 %t1444, ptr %local.b_ir.1253
  %t1445 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.275)
  %t1446 = ptrtoint ptr %t1445 to i64
  %t1447 = inttoptr i64 %t1446 to ptr
  call void @intrinsic_print(ptr %t1447)
  %t1448 = load i64, ptr %local.b_ir.1253
  %t1449 = call i64 @"print_f64"(i64 %t1448)
  %t1450 = load i64, ptr %local.b_ir.1253
  %t1451 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.276)
  %t1452 = call i64 @"sx_f64_add"(i64 %t1450, i64 %t1451)
  %t1453 = call i64 @"abs_f64"(i64 %t1452)
  %t1454 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.277)
  %t1455 = call i64 @"sx_f64_lt"(i64 %t1453, i64 %t1454)
  %t1456 = icmp ne i64 %t1455, 0
  br i1 %t1456, label %then34, label %else34
then34:
  %t1457 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.278)
  %t1458 = ptrtoint ptr %t1457 to i64
  %t1459 = inttoptr i64 %t1458 to ptr
  call void @intrinsic_println(ptr %t1459)
  br label %then34_end
then34_end:
  br label %endif34
else34:
  %t1460 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.279)
  %t1461 = ptrtoint ptr %t1460 to i64
  %t1462 = inttoptr i64 %t1461 to ptr
  call void @intrinsic_println(ptr %t1462)
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t1463 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t1464 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.280)
  %t1465 = ptrtoint ptr %t1464 to i64
  %t1466 = inttoptr i64 %t1465 to ptr
  call void @intrinsic_println(ptr %t1466)
  %t1467 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.281)
  %t1468 = ptrtoint ptr %t1467 to i64
  %t1469 = inttoptr i64 %t1468 to ptr
  call void @intrinsic_println(ptr %t1469)
  %t1470 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.282)
  %t1471 = ptrtoint ptr %t1470 to i64
  %t1472 = inttoptr i64 %t1471 to ptr
  call void @intrinsic_println(ptr %t1472)
  %t1473 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.283)
  %t1474 = ptrtoint ptr %t1473 to i64
  %t1475 = inttoptr i64 %t1474 to ptr
  call void @intrinsic_println(ptr %t1475)
  %t1476 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.284)
  %t1477 = ptrtoint ptr %t1476 to i64
  %t1478 = inttoptr i64 %t1477 to ptr
  call void @intrinsic_println(ptr %t1478)
  %t1479 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.285)
  %t1480 = ptrtoint ptr %t1479 to i64
  %t1481 = inttoptr i64 %t1480 to ptr
  call void @intrinsic_println(ptr %t1481)
  %t1482 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.286)
  %t1483 = ptrtoint ptr %t1482 to i64
  %t1484 = inttoptr i64 %t1483 to ptr
  call void @intrinsic_println(ptr %t1484)
  ret i64 0
}

define i64 @"test_market"() nounwind {
entry:
  %local.price.1485 = alloca i64
  %local.demand.1486 = alloca i64
  %local.supply.1487 = alloca i64
  %local.excess.1488 = alloca i64
  %local.g_buyer.1489 = alloca i64
  %local.g_seller.1490 = alloca i64
  %local.cross.1491 = alloca i64
  %local.ind.1492 = alloca i64
  %local.ir.1493 = alloca i64
  %t1494 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.287)
  %t1495 = ptrtoint ptr %t1494 to i64
  %t1496 = inttoptr i64 %t1495 to ptr
  call void @intrinsic_println(ptr %t1496)
  %t1497 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.288)
  %t1498 = ptrtoint ptr %t1497 to i64
  %t1499 = inttoptr i64 %t1498 to ptr
  call void @intrinsic_println(ptr %t1499)
  %t1500 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.289)
  %t1501 = ptrtoint ptr %t1500 to i64
  %t1502 = inttoptr i64 %t1501 to ptr
  call void @intrinsic_println(ptr %t1502)
  %t1503 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.290)
  %t1504 = ptrtoint ptr %t1503 to i64
  %t1505 = inttoptr i64 %t1504 to ptr
  call void @intrinsic_println(ptr %t1505)
  %t1506 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.291)
  store i64 %t1506, ptr %local.price.1485
  br label %loop35
loop35:
  %t1507 = load i64, ptr %local.price.1485
  %t1508 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.292)
  %t1509 = call i64 @"sx_f64_le"(i64 %t1507, i64 %t1508)
  %t1510 = icmp ne i64 %t1509, 0
  br i1 %t1510, label %body35, label %endloop35
body35:
  %t1511 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.293)
  %t1512 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.294)
  %t1513 = load i64, ptr %local.price.1485
  %t1514 = call i64 @"sx_f64_mul"(i64 %t1512, i64 %t1513)
  %t1515 = call i64 @"sx_f64_sub"(i64 %t1511, i64 %t1514)
  store i64 %t1515, ptr %local.demand.1486
  %t1516 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.295)
  %t1517 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.296)
  %t1518 = call i64 @"sx_f64_sub"(i64 %t1516, i64 %t1517)
  %t1519 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.297)
  %t1520 = load i64, ptr %local.price.1485
  %t1521 = call i64 @"sx_f64_mul"(i64 %t1519, i64 %t1520)
  %t1522 = call i64 @"sx_f64_add"(i64 %t1518, i64 %t1521)
  store i64 %t1522, ptr %local.supply.1487
  %t1523 = load i64, ptr %local.demand.1486
  %t1524 = load i64, ptr %local.supply.1487
  %t1525 = call i64 @"sx_f64_sub"(i64 %t1523, i64 %t1524)
  store i64 %t1525, ptr %local.excess.1488
  %t1526 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.298)
  %t1527 = load i64, ptr %local.demand.1486
  %t1528 = call i64 @"sx_f64_sub"(i64 %t1526, i64 %t1527)
  store i64 %t1528, ptr %local.g_buyer.1489
  %t1529 = load i64, ptr %local.supply.1487
  store i64 %t1529, ptr %local.g_seller.1490
  %t1530 = load i64, ptr %local.g_buyer.1489
  %t1531 = load i64, ptr %local.g_seller.1490
  %t1532 = call i64 @"sx_f64_mul"(i64 %t1530, i64 %t1531)
  store i64 %t1532, ptr %local.cross.1491
  %t1533 = load i64, ptr %local.g_buyer.1489
  %t1534 = load i64, ptr %local.g_buyer.1489
  %t1535 = call i64 @"sx_f64_mul"(i64 %t1533, i64 %t1534)
  %t1536 = load i64, ptr %local.g_seller.1490
  %t1537 = load i64, ptr %local.g_seller.1490
  %t1538 = call i64 @"sx_f64_mul"(i64 %t1536, i64 %t1537)
  %t1539 = call i64 @"sx_f64_add"(i64 %t1535, i64 %t1538)
  store i64 %t1539, ptr %local.ind.1492
  %t1540 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.299)
  store i64 %t1540, ptr %local.ir.1493
  %t1541 = load i64, ptr %local.ind.1492
  %t1542 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.300)
  %t1543 = call i64 @"sx_f64_gt"(i64 %t1541, i64 %t1542)
  %t1544 = icmp ne i64 %t1543, 0
  br i1 %t1544, label %then36, label %else36
then36:
  %t1545 = load i64, ptr %local.cross.1491
  %t1546 = load i64, ptr %local.ind.1492
  %t1547 = call i64 @"sx_f64_div"(i64 %t1545, i64 %t1546)
  store i64 %t1547, ptr %local.ir.1493
  br label %then36_end
then36_end:
  br label %endif36
else36:
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1548 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t1549 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.301)
  %t1550 = ptrtoint ptr %t1549 to i64
  %t1551 = inttoptr i64 %t1550 to ptr
  call void @intrinsic_print(ptr %t1551)
  %t1552 = load i64, ptr %local.price.1485
  %t1553 = call i64 @"print_f64"(i64 %t1552)
  %t1554 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.302)
  %t1555 = ptrtoint ptr %t1554 to i64
  %t1556 = inttoptr i64 %t1555 to ptr
  call void @intrinsic_print(ptr %t1556)
  %t1557 = load i64, ptr %local.demand.1486
  %t1558 = call i64 @"print_f64"(i64 %t1557)
  %t1559 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.303)
  %t1560 = ptrtoint ptr %t1559 to i64
  %t1561 = inttoptr i64 %t1560 to ptr
  call void @intrinsic_print(ptr %t1561)
  %t1562 = load i64, ptr %local.supply.1487
  %t1563 = call i64 @"print_f64"(i64 %t1562)
  %t1564 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.304)
  %t1565 = ptrtoint ptr %t1564 to i64
  %t1566 = inttoptr i64 %t1565 to ptr
  call void @intrinsic_print(ptr %t1566)
  %t1567 = load i64, ptr %local.ir.1493
  %t1568 = call i64 @"print_f64"(i64 %t1567)
  %t1569 = load i64, ptr %local.ir.1493
  %t1570 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.305)
  %t1571 = call i64 @"sx_f64_add"(i64 %t1569, i64 %t1570)
  %t1572 = call i64 @"abs_f64"(i64 %t1571)
  %t1573 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.306)
  %t1574 = call i64 @"sx_f64_lt"(i64 %t1572, i64 %t1573)
  %t1575 = icmp ne i64 %t1574, 0
  br i1 %t1575, label %then37, label %else37
then37:
  %t1576 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.307)
  %t1577 = ptrtoint ptr %t1576 to i64
  %t1578 = inttoptr i64 %t1577 to ptr
  call void @intrinsic_println(ptr %t1578)
  br label %then37_end
then37_end:
  br label %endif37
else37:
  %t1579 = load i64, ptr %local.excess.1488
  %t1580 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.308)
  %t1581 = call i64 @"sx_f64_gt"(i64 %t1579, i64 %t1580)
  %t1582 = icmp ne i64 %t1581, 0
  br i1 %t1582, label %then38, label %else38
then38:
  %t1583 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.309)
  %t1584 = ptrtoint ptr %t1583 to i64
  %t1585 = inttoptr i64 %t1584 to ptr
  call void @intrinsic_println(ptr %t1585)
  br label %then38_end
then38_end:
  br label %endif38
else38:
  %t1586 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.310)
  %t1587 = ptrtoint ptr %t1586 to i64
  %t1588 = inttoptr i64 %t1587 to ptr
  call void @intrinsic_println(ptr %t1588)
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t1589 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  br label %else37_end
else37_end:
  br label %endif37
endif37:
  %t1590 = phi i64 [ 0, %then37_end ], [ %t1589, %else37_end ]
  %t1591 = load i64, ptr %local.price.1485
  %t1592 = call i64 @f64_parse(ptr @.str.exp_iratio_applications.311)
  %t1593 = call i64 @"sx_f64_add"(i64 %t1591, i64 %t1592)
  store i64 %t1593, ptr %local.price.1485
  br label %loop35
endloop35:
  %t1594 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.312)
  %t1595 = ptrtoint ptr %t1594 to i64
  %t1596 = inttoptr i64 %t1595 to ptr
  call void @intrinsic_println(ptr %t1596)
  %t1597 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.313)
  %t1598 = ptrtoint ptr %t1597 to i64
  %t1599 = inttoptr i64 %t1598 to ptr
  call void @intrinsic_println(ptr %t1599)
  %t1600 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.314)
  %t1601 = ptrtoint ptr %t1600 to i64
  %t1602 = inttoptr i64 %t1601 to ptr
  call void @intrinsic_println(ptr %t1602)
  %t1603 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.315)
  %t1604 = ptrtoint ptr %t1603 to i64
  %t1605 = inttoptr i64 %t1604 to ptr
  call void @intrinsic_println(ptr %t1605)
  %t1606 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.316)
  %t1607 = ptrtoint ptr %t1606 to i64
  %t1608 = inttoptr i64 %t1607 to ptr
  call void @intrinsic_println(ptr %t1608)
  %t1609 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.317)
  %t1610 = ptrtoint ptr %t1609 to i64
  %t1611 = inttoptr i64 %t1610 to ptr
  call void @intrinsic_println(ptr %t1611)
  ret i64 0
}

define i64 @"simplex_main"() nounwind {
entry:
  %t1612 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.318)
  %t1613 = ptrtoint ptr %t1612 to i64
  %t1614 = inttoptr i64 %t1613 to ptr
  call void @intrinsic_println(ptr %t1614)
  %t1615 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.319)
  %t1616 = ptrtoint ptr %t1615 to i64
  %t1617 = inttoptr i64 %t1616 to ptr
  call void @intrinsic_println(ptr %t1617)
  %t1618 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.320)
  %t1619 = ptrtoint ptr %t1618 to i64
  %t1620 = inttoptr i64 %t1619 to ptr
  call void @intrinsic_println(ptr %t1620)
  %t1621 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.321)
  %t1622 = ptrtoint ptr %t1621 to i64
  %t1623 = inttoptr i64 %t1622 to ptr
  call void @intrinsic_println(ptr %t1623)
  %t1624 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.322)
  %t1625 = ptrtoint ptr %t1624 to i64
  %t1626 = inttoptr i64 %t1625 to ptr
  call void @intrinsic_println(ptr %t1626)
  %t1627 = call i64 @"test_multitask"()
  %t1628 = call i64 @"test_portfolio"()
  %t1629 = call i64 @"test_ecosystem"()
  %t1630 = call i64 @"test_gradient_health"()
  %t1631 = call i64 @"test_market"()
  %t1632 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.323)
  %t1633 = ptrtoint ptr %t1632 to i64
  %t1634 = inttoptr i64 %t1633 to ptr
  call void @intrinsic_println(ptr %t1634)
  %t1635 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.324)
  %t1636 = ptrtoint ptr %t1635 to i64
  %t1637 = inttoptr i64 %t1636 to ptr
  call void @intrinsic_println(ptr %t1637)
  %t1638 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.325)
  %t1639 = ptrtoint ptr %t1638 to i64
  %t1640 = inttoptr i64 %t1639 to ptr
  call void @intrinsic_println(ptr %t1640)
  %t1641 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.326)
  %t1642 = ptrtoint ptr %t1641 to i64
  %t1643 = inttoptr i64 %t1642 to ptr
  call void @intrinsic_println(ptr %t1643)
  %t1644 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.327)
  %t1645 = ptrtoint ptr %t1644 to i64
  %t1646 = inttoptr i64 %t1645 to ptr
  call void @intrinsic_println(ptr %t1646)
  %t1647 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.328)
  %t1648 = ptrtoint ptr %t1647 to i64
  %t1649 = inttoptr i64 %t1648 to ptr
  call void @intrinsic_println(ptr %t1649)
  %t1650 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.329)
  %t1651 = ptrtoint ptr %t1650 to i64
  %t1652 = inttoptr i64 %t1651 to ptr
  call void @intrinsic_println(ptr %t1652)
  %t1653 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.330)
  %t1654 = ptrtoint ptr %t1653 to i64
  %t1655 = inttoptr i64 %t1654 to ptr
  call void @intrinsic_println(ptr %t1655)
  %t1656 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.331)
  %t1657 = ptrtoint ptr %t1656 to i64
  %t1658 = inttoptr i64 %t1657 to ptr
  call void @intrinsic_println(ptr %t1658)
  %t1659 = call ptr @intrinsic_string_new(ptr @.str.exp_iratio_applications.332)
  %t1660 = ptrtoint ptr %t1659 to i64
  %t1661 = inttoptr i64 %t1660 to ptr
  call void @intrinsic_println(ptr %t1661)
  ret i64 0
}


; String constants
@.str.exp_iratio_applications.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.2 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.3 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.4 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.5 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.6 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.7 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.8 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.9 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.10 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.11 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.12 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.13 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.14 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.15 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.16 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.17 = private unnamed_addr constant [12 x i8] c"0.000000001\00"
@.str.exp_iratio_applications.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.19 = private unnamed_addr constant [47 x i8] c"--- Exp 1: Multi-Task Fairness via I_ratio ---\00"
@.str.exp_iratio_applications.20 = private unnamed_addr constant [47 x i8] c"  3 tasks on 4D, equal weight. eq at (1,1,1,0)\00"
@.str.exp_iratio_applications.21 = private unnamed_addr constant [36 x i8] c"  I = -0.5 means perfectly balanced\00"
@.str.exp_iratio_applications.22 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.23 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.25 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.27 = private unnamed_addr constant [52 x i8] c"  step    w0      w1      w2      I_ratio    Status\00"
@.str.exp_iratio_applications.28 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.29 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.30 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.31 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.32 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.33 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.34 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.35 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.36 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.37 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.38 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.39 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.40 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.41 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.42 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.43 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.44 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.45 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.46 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.47 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.48 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.49 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.50 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.51 = private unnamed_addr constant [11 x i8] c"  0       \00"
@.str.exp_iratio_applications.52 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.53 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.54 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.55 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.56 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.57 = private unnamed_addr constant [11 x i8] c"  BALANCED\00"
@.str.exp_iratio_applications.58 = private unnamed_addr constant [13 x i8] c"  UNBALANCED\00"
@.str.exp_iratio_applications.59 = private unnamed_addr constant [11 x i8] c"  10      \00"
@.str.exp_iratio_applications.60 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.61 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.62 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.63 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.64 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.65 = private unnamed_addr constant [11 x i8] c"  BALANCED\00"
@.str.exp_iratio_applications.66 = private unnamed_addr constant [13 x i8] c"  UNBALANCED\00"
@.str.exp_iratio_applications.67 = private unnamed_addr constant [11 x i8] c"  50      \00"
@.str.exp_iratio_applications.68 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.69 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.70 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.71 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.72 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.73 = private unnamed_addr constant [11 x i8] c"  BALANCED\00"
@.str.exp_iratio_applications.74 = private unnamed_addr constant [13 x i8] c"  UNBALANCED\00"
@.str.exp_iratio_applications.75 = private unnamed_addr constant [11 x i8] c"  100     \00"
@.str.exp_iratio_applications.76 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.77 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.78 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.79 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.80 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.81 = private unnamed_addr constant [11 x i8] c"  BALANCED\00"
@.str.exp_iratio_applications.82 = private unnamed_addr constant [13 x i8] c"  UNBALANCED\00"
@.str.exp_iratio_applications.83 = private unnamed_addr constant [11 x i8] c"  299     \00"
@.str.exp_iratio_applications.84 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.85 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.86 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.87 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.88 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.89 = private unnamed_addr constant [11 x i8] c"  BALANCED\00"
@.str.exp_iratio_applications.90 = private unnamed_addr constant [13 x i8] c"  UNBALANCED\00"
@.str.exp_iratio_applications.91 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.92 = private unnamed_addr constant [41 x i8] c"  Unfair training: Task A gets 5x weight\00"
@.str.exp_iratio_applications.93 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.94 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.95 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.96 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.97 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_iratio_applications.98 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.99 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.100 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.101 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.102 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_iratio_applications.103 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.104 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.105 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.106 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.107 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_iratio_applications.108 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.109 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.110 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.111 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.112 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_iratio_applications.113 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.114 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.115 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.116 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.117 = private unnamed_addr constant [4 x i8] c"7.0\00"
@.str.exp_iratio_applications.118 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.119 = private unnamed_addr constant [4 x i8] c"7.0\00"
@.str.exp_iratio_applications.120 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.121 = private unnamed_addr constant [4 x i8] c"7.0\00"
@.str.exp_iratio_applications.122 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.123 = private unnamed_addr constant [4 x i8] c"7.0\00"
@.str.exp_iratio_applications.124 = private unnamed_addr constant [11 x i8] c"  299     \00"
@.str.exp_iratio_applications.125 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.126 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.127 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.128 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.129 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.130 = private unnamed_addr constant [11 x i8] c"  BALANCED\00"
@.str.exp_iratio_applications.131 = private unnamed_addr constant [34 x i8] c"  UNBALANCED — Task A dominates\00"
@.str.exp_iratio_applications.132 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.133 = private unnamed_addr constant [55 x i8] c"  FINDING: I_ratio detects task imbalance in real-time\00"
@.str.exp_iratio_applications.134 = private unnamed_addr constant [51 x i8] c"  I = -0.5: fair. I ≠ -0.5: some task dominates.\00"
@.str.exp_iratio_applications.135 = private unnamed_addr constant [47 x i8] c"  This is a single-number fairness diagnostic.\00"
@.str.exp_iratio_applications.136 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.137 = private unnamed_addr constant [41 x i8] c"--- Exp 2: Portfolio Diversification ---\00"
@.str.exp_iratio_applications.138 = private unnamed_addr constant [43 x i8] c"  3 assets with returns pulling allocation\00"
@.str.exp_iratio_applications.139 = private unnamed_addr constant [39 x i8] c"  I = -0.5 means optimally diversified\00"
@.str.exp_iratio_applications.140 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.141 = private unnamed_addr constant [5 x i8] c"0.33\00"
@.str.exp_iratio_applications.142 = private unnamed_addr constant [5 x i8] c"0.33\00"
@.str.exp_iratio_applications.143 = private unnamed_addr constant [56 x i8] c"  step  w1      w2      w3      I_ratio    Diversified?\00"
@.str.exp_iratio_applications.144 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.145 = private unnamed_addr constant [5 x i8] c"0.08\00"
@.str.exp_iratio_applications.146 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_iratio_applications.147 = private unnamed_addr constant [5 x i8] c"0.15\00"
@.str.exp_iratio_applications.148 = private unnamed_addr constant [5 x i8] c"0.12\00"
@.str.exp_iratio_applications.149 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_iratio_applications.150 = private unnamed_addr constant [5 x i8] c"0.25\00"
@.str.exp_iratio_applications.151 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_iratio_applications.152 = private unnamed_addr constant [5 x i8] c"0.10\00"
@.str.exp_iratio_applications.153 = private unnamed_addr constant [5 x i8] c"0.10\00"
@.str.exp_iratio_applications.154 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.155 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.156 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.157 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.158 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.159 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.160 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.161 = private unnamed_addr constant [9 x i8] c"0.000001\00"
@.str.exp_iratio_applications.162 = private unnamed_addr constant [9 x i8] c"  0     \00"
@.str.exp_iratio_applications.163 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.164 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.165 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.166 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.167 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.168 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_iratio_applications.169 = private unnamed_addr constant [6 x i8] c"  YES\00"
@.str.exp_iratio_applications.170 = private unnamed_addr constant [5 x i8] c"  NO\00"
@.str.exp_iratio_applications.171 = private unnamed_addr constant [9 x i8] c"  100   \00"
@.str.exp_iratio_applications.172 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.173 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.174 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.175 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.176 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.177 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_iratio_applications.178 = private unnamed_addr constant [6 x i8] c"  YES\00"
@.str.exp_iratio_applications.179 = private unnamed_addr constant [5 x i8] c"  NO\00"
@.str.exp_iratio_applications.180 = private unnamed_addr constant [9 x i8] c"  499   \00"
@.str.exp_iratio_applications.181 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.182 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.183 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.184 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.185 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.186 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_iratio_applications.187 = private unnamed_addr constant [6 x i8] c"  YES\00"
@.str.exp_iratio_applications.188 = private unnamed_addr constant [5 x i8] c"  NO\00"
@.str.exp_iratio_applications.189 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_iratio_applications.190 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_iratio_applications.191 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.192 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.193 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.194 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.195 = private unnamed_addr constant [5 x i8] c"0.98\00"
@.str.exp_iratio_applications.196 = private unnamed_addr constant [5 x i8] c"0.98\00"
@.str.exp_iratio_applications.197 = private unnamed_addr constant [5 x i8] c"0.98\00"
@.str.exp_iratio_applications.198 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.199 = private unnamed_addr constant [57 x i8] c"  FINDING: I_ratio tracks portfolio balance in real-time\00"
@.str.exp_iratio_applications.200 = private unnamed_addr constant [59 x i8] c"  When I → -0.5: forces balanced = optimally diversified\00"
@.str.exp_iratio_applications.201 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.202 = private unnamed_addr constant [35 x i8] c"--- Exp 3: Ecosystem Stability ---\00"
@.str.exp_iratio_applications.203 = private unnamed_addr constant [41 x i8] c"  Predator/Prey/Plant on shared resource\00"
@.str.exp_iratio_applications.204 = private unnamed_addr constant [38 x i8] c"  I = -0.5 when ecosystem is balanced\00"
@.str.exp_iratio_applications.205 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.206 = private unnamed_addr constant [41 x i8] c"  Resource state    I_ratio    Ecosystem\00"
@.str.exp_iratio_applications.207 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.208 = private unnamed_addr constant [5 x i8] c"3.01\00"
@.str.exp_iratio_applications.209 = private unnamed_addr constant [4 x i8] c"1.5\00"
@.str.exp_iratio_applications.210 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.211 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.212 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.213 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.214 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.215 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.216 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.217 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.218 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.219 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.220 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.221 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.222 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.223 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.224 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.225 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.226 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_iratio_applications.227 = private unnamed_addr constant [6 x i8] c"  d0=\00"
@.str.exp_iratio_applications.228 = private unnamed_addr constant [5 x i8] c"  I=\00"
@.str.exp_iratio_applications.229 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.230 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_iratio_applications.231 = private unnamed_addr constant [20 x i8] c"  ** EQUILIBRIUM **\00"
@.str.exp_iratio_applications.232 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_iratio_applications.233 = private unnamed_addr constant [29 x i8] c"  species aligned (unstable)\00"
@.str.exp_iratio_applications.234 = private unnamed_addr constant [18 x i8] c"  partial balance\00"
@.str.exp_iratio_applications.235 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.236 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.237 = private unnamed_addr constant [49 x i8] c"  FINDING: I_ratio detects ecosystem equilibrium\00"
@.str.exp_iratio_applications.238 = private unnamed_addr constant [56 x i8] c"  from species growth gradients alone — no population\00"
@.str.exp_iratio_applications.239 = private unnamed_addr constant [25 x i8] c"  dynamics model needed.\00"
@.str.exp_iratio_applications.240 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.241 = private unnamed_addr constant [46 x i8] c"--- Exp 4: Neural Network Gradient Health ---\00"
@.str.exp_iratio_applications.242 = private unnamed_addr constant [51 x i8] c"  3-layer network. I_ratio between layer gradients\00"
@.str.exp_iratio_applications.243 = private unnamed_addr constant [54 x i8] c"  I ≈ -0.5: balanced flow. I ≠ -0.5: pathological\00"
@.str.exp_iratio_applications.244 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.245 = private unnamed_addr constant [67 x i8] c"  Scenario           Layer grads (magnitudes)    I_ratio    Health\00"
@.str.exp_iratio_applications.246 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.247 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.248 = private unnamed_addr constant [4 x i8] c"0.8\00"
@.str.exp_iratio_applications.249 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.250 = private unnamed_addr constant [50 x i8] c"  Healthy:           1.0, -0.8, 0.5              \00"
@.str.exp_iratio_applications.251 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.252 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_iratio_applications.253 = private unnamed_addr constant [7 x i8] c"  GOOD\00"
@.str.exp_iratio_applications.254 = private unnamed_addr constant [10 x i8] c"  WARNING\00"
@.str.exp_iratio_applications.255 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.256 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_iratio_applications.257 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_iratio_applications.258 = private unnamed_addr constant [50 x i8] c"  Vanishing:         1.0, 0.01, 0.0001           \00"
@.str.exp_iratio_applications.259 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.260 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_iratio_applications.261 = private unnamed_addr constant [7 x i8] c"  GOOD\00"
@.str.exp_iratio_applications.262 = private unnamed_addr constant [13 x i8] c"  VANISHING!\00"
@.str.exp_iratio_applications.263 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.264 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_iratio_applications.265 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_iratio_applications.266 = private unnamed_addr constant [50 x i8] c"  Exploding:         1.0, 10.0, 100.0            \00"
@.str.exp_iratio_applications.267 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.268 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_iratio_applications.269 = private unnamed_addr constant [7 x i8] c"  GOOD\00"
@.str.exp_iratio_applications.270 = private unnamed_addr constant [13 x i8] c"  EXPLODING!\00"
@.str.exp_iratio_applications.271 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.272 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.273 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_iratio_applications.274 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.275 = private unnamed_addr constant [50 x i8] c"  Balanced opposing: 1.0, -1.0, 0.5              \00"
@.str.exp_iratio_applications.276 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.277 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_iratio_applications.278 = private unnamed_addr constant [7 x i8] c"  GOOD\00"
@.str.exp_iratio_applications.279 = private unnamed_addr constant [10 x i8] c"  WARNING\00"
@.str.exp_iratio_applications.280 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.281 = private unnamed_addr constant [34 x i8] c"  FINDING: I_ratio distinguishes:\00"
@.str.exp_iratio_applications.282 = private unnamed_addr constant [39 x i8] c"  - Healthy gradient flow (I ≈ -0.5)\00"
@.str.exp_iratio_applications.283 = private unnamed_addr constant [47 x i8] c"  - Vanishing gradients (I ≈ 0, all aligned)\00"
@.str.exp_iratio_applications.284 = private unnamed_addr constant [57 x i8] c"  - Exploding gradients (I ≈ 0.5, one layer dominates)\00"
@.str.exp_iratio_applications.285 = private unnamed_addr constant [53 x i8] c"  A single number replaces gradient norm monitoring.\00"
@.str.exp_iratio_applications.286 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.287 = private unnamed_addr constant [48 x i8] c"--- Exp 5: Supply/Demand Market Equilibrium ---\00"
@.str.exp_iratio_applications.288 = private unnamed_addr constant [49 x i8] c"  Track I_ratio as price adjusts toward clearing\00"
@.str.exp_iratio_applications.289 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.290 = private unnamed_addr constant [44 x i8] c"  price   demand  supply  I_ratio    Market\00"
@.str.exp_iratio_applications.291 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_iratio_applications.292 = private unnamed_addr constant [6 x i8] c"45.01\00"
@.str.exp_iratio_applications.293 = private unnamed_addr constant [6 x i8] c"100.0\00"
@.str.exp_iratio_applications.294 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_iratio_applications.295 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.296 = private unnamed_addr constant [5 x i8] c"20.0\00"
@.str.exp_iratio_applications.297 = private unnamed_addr constant [4 x i8] c"3.0\00"
@.str.exp_iratio_applications.298 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.299 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.300 = private unnamed_addr constant [6 x i8] c"0.001\00"
@.str.exp_iratio_applications.301 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.302 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.303 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.304 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_iratio_applications.305 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_iratio_applications.306 = private unnamed_addr constant [5 x i8] c"0.02\00"
@.str.exp_iratio_applications.307 = private unnamed_addr constant [15 x i8] c"  ** CLEARS **\00"
@.str.exp_iratio_applications.308 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_iratio_applications.309 = private unnamed_addr constant [16 x i8] c"  excess demand\00"
@.str.exp_iratio_applications.310 = private unnamed_addr constant [16 x i8] c"  excess supply\00"
@.str.exp_iratio_applications.311 = private unnamed_addr constant [4 x i8] c"5.0\00"
@.str.exp_iratio_applications.312 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.313 = private unnamed_addr constant [55 x i8] c"  FINDING: I_ratio = -0.5 exactly when supply = demand\00"
@.str.exp_iratio_applications.314 = private unnamed_addr constant [56 x i8] c"  The market clearing price IS the force-balance point.\00"
@.str.exp_iratio_applications.315 = private unnamed_addr constant [57 x i8] c"  I_ratio provides a gradient-based equilibrium detector\00"
@.str.exp_iratio_applications.316 = private unnamed_addr constant [55 x i8] c"  for ANY market — without solving the S=D equation.\00"
@.str.exp_iratio_applications.317 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.318 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_iratio_applications.319 = private unnamed_addr constant [32 x i8] c"  I-RATIO THEOREM: APPLICATIONS\00"
@.str.exp_iratio_applications.320 = private unnamed_addr constant [42 x i8] c"  I = -0.5 iff forces balance (universal)\00"
@.str.exp_iratio_applications.321 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_iratio_applications.322 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_iratio_applications.323 = private unnamed_addr constant [45 x i8] c"============================================\00"
@.str.exp_iratio_applications.324 = private unnamed_addr constant [25 x i8] c"  UNIVERSAL APPLICATION:\00"
@.str.exp_iratio_applications.325 = private unnamed_addr constant [41 x i8] c"  I_ratio = -0.5 detects equilibrium in:\00"
@.str.exp_iratio_applications.326 = private unnamed_addr constant [40 x i8] c"  - Multi-task learning (task fairness)\00"
@.str.exp_iratio_applications.327 = private unnamed_addr constant [43 x i8] c"  - Portfolio allocation (diversification)\00"
@.str.exp_iratio_applications.328 = private unnamed_addr constant [33 x i8] c"  - Ecosystems (species balance)\00"
@.str.exp_iratio_applications.329 = private unnamed_addr constant [38 x i8] c"  - Neural networks (gradient health)\00"
@.str.exp_iratio_applications.330 = private unnamed_addr constant [30 x i8] c"  - Markets (supply = demand)\00"
@.str.exp_iratio_applications.331 = private unnamed_addr constant [41 x i8] c"  One number. One threshold. Any domain.\00"
@.str.exp_iratio_applications.332 = private unnamed_addr constant [45 x i8] c"============================================\00"
